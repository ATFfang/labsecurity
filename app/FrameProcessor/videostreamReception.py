import os
os.environ["OPENCV_FFMPEG_CAPTURE_OPTIONS"] = "loglevel;quiet"
import cv2
import time
import json
from pathlib import Path
from typing import Dict, List
from threading import Thread, Event
from datetime import datetime
import sys

current_file = Path(__file__).resolve()
parent_dir = current_file.parent.parent
sys.path.insert(0, str(parent_dir))

from MessageQueues import GlobalMessageQueue, PhotoMessage
from concurrent.futures import ThreadPoolExecutor
from PIL import Image

# 获取当前文件路径
CURRENT_PATH = Path(__file__).resolve()
# CONFIG_PATH = CURRENT_PATH.parent / "config.json"
CONFIG_PATH = CURRENT_PATH.parent / "config.json"

PHOTO_OUTPUT_DIR_LIVE = (CURRENT_PATH.parent / ".." / "MessageQueues" / "photo").resolve()
PHOTO_OUTPUT_DIR_LOCAL = (CURRENT_PATH.parent / ".." / "MessageQueues" / "photo").resolve()

from Log import logger

# 创建全局共享的消息队列实例
global_mq = GlobalMessageQueue()

class VideoStreamWorker(Thread):
    def __init__(self, config: Dict):
        super().__init__(daemon=True)
        self.camera_id = config['camera_id']
        self.room_id = config.get('room_id', -1)
        self.stream_url = config['stream_url']
        self.frame_interval = config.get('frame_interval', 1.0)
        self.output_dir = PHOTO_OUTPUT_DIR_LIVE
        self.stop_event = Event()
        self.mq = global_mq 
        
    def run(self):
        self.output_dir.mkdir(parents=True, exist_ok=True)
        cap = cv2.VideoCapture(self.stream_url)

        last_capture = 0
        while not self.stop_event.is_set():
            success, frame = self._safe_read(cap)
            if not success:
                continue

            current_time = time.time()
            if current_time - last_capture >= self.frame_interval:
                self._process_frame(frame, current_time)
                last_capture = current_time

            time.sleep(0.1)

        cap.release()

    def stop(self):
        self.stop_event.set()

    def _safe_read(self, cap):
        for _ in range(3):
            ret, frame = cap.read()
            if ret:
                return True, frame
            print(f"[{self.camera_id}] 断流，尝试重连...")
            time.sleep(5)
            cap.release()
            cap = cv2.VideoCapture(self.stream_url)
        return False, None

    def _process_frame(self, frame, timestamp):
        filename = f"{self.camera_id}_{int(timestamp)}.jpg"
        frame_path = self.output_dir / filename

        pil_image = Image.fromarray(cv2.cvtColor(frame, cv2.COLOR_BGR2RGB))
        pil_image.save(str(frame_path))
        
        msg = PhotoMessage(
            camera_id=self.camera_id,
            room_id=self.room_id,
            photo_path=frame_path,
            timestamp=datetime.fromtimestamp(timestamp),
            metadata={'resolution': f"{frame.shape[1]}x{frame.shape[0]}"}
        )
        self.mq.put_message(msg)

class VideoSlicer(Thread):
    def __init__(self, config: Dict):
        super().__init__(daemon=True)
        self.camera_id = config['camera_id']
        self.room_id = config.get('room_id', -1)
        self.video_url = config['video_url']
        self.slice_interval = config.get('slice_interval', 300)
        self.output_dir = PHOTO_OUTPUT_DIR_LOCAL
        self.stop_event = Event()
        self.mq = global_mq
        self.executor = ThreadPoolExecutor(max_workers=4)

    def run(self):
        self.output_dir.mkdir(parents=True, exist_ok=True)
        cap = cv2.VideoCapture(self.video_url)

        if not cap.isOpened():
            logger.info(f"[{self.camera_id}] 无法打开本地视频文件：{self.video_url}")
            return

        fps = cap.get(cv2.CAP_PROP_FPS)
        total_frames = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        duration = total_frames / fps

        logger.info(f"[{self.camera_id}] 视频时长: {duration:.2f}秒, FPS: {fps}, 总帧数: {total_frames}")

        frame_interval = int(fps * self.slice_interval)  # 每隔多少帧提取一帧

        current_frame = 0
        while not self.stop_event.is_set() and current_frame < total_frames:
            cap.set(cv2.CAP_PROP_POS_FRAMES, current_frame)
            success, frame = cap.read()
            if not success:
                print(f"[{self.camera_id}] 第{current_frame}帧读取失败")
                break

            timestamp = cap.get(cv2.CAP_PROP_POS_MSEC) / 1000  # 获取当前帧对应的时间（秒）
            self.executor.submit(self._process_frame, frame.copy(), timestamp)

            current_frame += frame_interval

        cap.release()
        self.executor.shutdown(wait=True)
        logger.info(f"[{self.camera_id}] 本地视频切片完毕")

    def stop(self):
        self.stop_event.set()

    def _process_frame(self, frame, timestamp):
        filename = f"{self.room_id}_{self.camera_id}_{int(timestamp)}.jpg"
        frame_path = self.output_dir / filename

        pil_image = Image.fromarray(cv2.cvtColor(frame, cv2.COLOR_BGR2RGB))
        pil_image.save(str(frame_path))

        msg = PhotoMessage(
            camera_id=self.camera_id,
            room_id=self.room_id,
            photo_path=frame_path,
            timestamp=datetime.fromtimestamp(timestamp),
            metadata={'resolution': f"{frame.shape[1]}x{frame.shape[0]}"}
        )
        self.mq.put_message(msg)

    
def run_all_streams():
    """读取 config.json 并启动所有视频流线程"""
    with open(CONFIG_PATH, "r") as f:
        configs = json.load(f)

    workers: List[VideoStreamWorker] = []
    for config in configs:
        worker = VideoStreamWorker(config)
        worker.start()
        workers.append(worker)
        print(f"[启动] 摄像头：{config['camera_id']}")
        logger.info(f"[启动] 摄像头：{config['camera_id']}")

    try:
        while True:
            print(f"队列中消息数量: {global_mq.size()}")
            time.sleep(5)
    except KeyboardInterrupt:
        print("\n[退出] 正在停止所有摄像头...")
        for w in workers:
            w.stop()
        for w in workers:
            w.join()
        print("[完成] 所有线程已关闭")

def run_all_local_videos():
    """读取 config_local.json 并启动所有本地视频处理线程"""
    with open(CONFIG_PATH, "r", encoding= 'utf-8') as f:
        configs = json.load(f)

    slicers: List[VideoSlicer] = []
    for config in configs:
        slicer = VideoSlicer(config)
        slicer.start()
        slicers.append(slicer)
        print(f"[启动] 视频文件：{config['video_url']}")
        logger.info(f"[启动] 视频文件：{config['video_url']}")

    try:
        while any(s.is_alive() for s in slicers):
            pass
            print(f"队列中消息数量: {global_mq.size()}")
            time.sleep(5)
    except KeyboardInterrupt:
        print("\n[退出] 正在停止所有本地视频线程...")
        for s in slicers:
            s.stop()
        for s in slicers:
            s.join()
        print("[完成] 所有线程已关闭")

if __name__ == '__main__':
    run_all_local_videos()
    a = 1