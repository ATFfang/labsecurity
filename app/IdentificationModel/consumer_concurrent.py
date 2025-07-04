from pathlib import Path
import sys
import threading
import time
from typing import List, Dict
from concurrent.futures import ThreadPoolExecutor
from PIL import Image
import numpy as np
import os
import json

# 添加父路径，确保可导入全局模块
current_file = Path(__file__).resolve()
parent_dir = current_file.parent.parent
sys.path.insert(0, str(parent_dir))

from MessageQueues import GlobalMessageQueue, PhotoMessage
from FrameProcessor import global_mq
from .BaseModel import IdentificationModel
from DataBase import DataSaver


class PhotoConsumer(threading.Thread):
    def __init__(self, config_list: List[dict], poll_interval: float = 1, max_workers: int = 4):
        """
        多线程消费者：从 global_mq 获取消息，读取图片，执行模型推理，并删除图片。

        :param config_list: 一组 config 字典（每个配置一个模型）
        :param poll_interval: 轮询间隔秒数
        :param max_workers: 并发处理的最大线程数
        """
        super().__init__(daemon=True)
        self.poll_interval = poll_interval
        self.running = True
        self.db = DataSaver()
        self.executor = ThreadPoolExecutor(max_workers=max_workers)

        # 初始化模型列表
        self.modellist = [IdentificationModel(config) for config in config_list]

    def stop(self):
        """停止线程并关闭线程池"""
        self.running = False
        self.executor.shutdown(wait=True)

    def run(self):
        """主线程循环获取消息并交由线程池处理"""
        while self.running:
            message: PhotoMessage = global_mq.get_message()
            if message is None:
                time.sleep(self.poll_interval)
                continue

            self.executor.submit(self.process_message, message)

    def process_message(self, message: PhotoMessage):
        """处理单条消息的识别与存储"""
        try:
            if not message.photo_path.exists():
                print(f"[Warning] 图片不存在: {message.photo_path}")
                return

            for model in self.modellist:
                photo = model.preprocess_image(message)
                output = model.predict(message, photo)

                if output is not None:
                    print("[Info] 检测到异常情况")
                    try:
                        self.db.insert(output)
                    except Exception as e:
                        print(f"[Error] 数据库插入失败: {e}")

            try:
                os.remove(message.photo_path)
                # print(f"[Info] 删除图片: {message.photo_path}")
            except Exception as e:
                print(f"[Error] 删除图片失败: {e}")

        except Exception as e:
            print(f"[Error] 消费消息失败: {e}")


# 定义一个函数，用于启动照片消费者
def start_photo_consumer_concurrent():
    with open(r"E:\Project\Commercial\保卫处项目\Model\app\IdentificationModel\BaseModel\singleconfig.json", "r", encoding="utf-8") as f:
        config = json.load(f)
    config_list = [config]
    consumer = PhotoConsumer(config_list, max_workers=4)  # 可调整线程数
    consumer.start()
    return consumer


if __name__ == "__main__":
    # with open(r"E:\Project\Commercial\保卫处项目\Model\app\IdentificationModel\BaseModel\singleconfig.json", "r", encoding="utf-8") as f:
    #     config = json.load(f)
    # config_list = [config]

    # consumer = PhotoConsumer(config_list, max_workers=4)
    # consumer.start()

    # # 防止主线程退出
    # while True:
    #     time.sleep(10)
    pass
