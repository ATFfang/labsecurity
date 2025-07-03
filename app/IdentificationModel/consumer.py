from pathlib import Path
import sys
import threading
import time
from typing import Callable, List
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
    def __init__(self, config_list: List[dict], poll_interval: float = 1):
        """
        消费者线程，不断从 global_mq 获取消息，读取图片，执行模型推理，并删除图片。

        :param config_list: 一组config
        :param poll_interval: 轮询间隔秒数
        """
        super().__init__(daemon=True)
        # self.model_pipeline = model_pipeline
        self.poll_interval = poll_interval
        self.running = True
        self.db = DataSaver()

        self.modellist = []
        for config in config_list:
            self.modellist.append(IdentificationModel(config))

    def stop(self):
        """停止线程"""
        self.running = False

    def run(self):
        """主线程逻辑"""
        while self.running:
            message: PhotoMessage = global_mq.get_message()
            if message is None:
                time.sleep(self.poll_interval)
                continue

            try:
                # 加载图片
                if not message.photo_path.exists():
                    print(f"[Warning] 图片不存在: {message.photo_path}")
                    continue

                # with Image.open(message.photo_path) as img:
                #     image_np = np.array(img.convert("RGB"))

                # 调用模型处理函数! 重要入口！
                for model in self.modellist:
                    
                    photo = model.preprocess_image(message)
                    # print(photo)
                    output = model.predict(message, photo)
                    
                    if output != None:
                        print("[Info] 检测到异常情况")
                        try:
                            self.db.insert(output)
                        except Exception as e:
                            print(f"[Error] 数据库插入失败: {e}")
                            
                
                 # 删除图片文件
                try:
                    os.remove(message.photo_path)
                    # print(f"[Info] 删除图片: {message.photo_path}")
                except Exception as e:
                    print(f"[Error] 删除图片失败: {e}")

            except Exception as e:
                print(f"[Error] {message}消费消息失败: {e}")

           


# 浅浅试一下
def dummy_model(image: np.ndarray, message: PhotoMessage):
    print(f"处理来自 {message.camera_id} 的图片: {image.shape}, 时间: {message.timestamp}")

# 定义一个函数，用于启动照片消费者
def start_photo_consumer():
    with open(r"E:\Project\Commercial\保卫处项目\Model\app\IdentificationModel\BaseModel\singleconfig.json", "r", encoding="utf-8") as f:
        config = json.load(f)
    config_list = [config]
    # 创建一个照片消费者对象，传入一个模型列表
    consumer = PhotoConsumer(config_list)
    # 启动照片消费者
    consumer.start()
    # 返回照片消费者对象
    return consumer


if __name__ == "__main__":
    with open(r"E:\Project\Commercial\保卫处项目\Model\app\IdentificationModel\BaseModel\singleconfig.json", "r", encoding="utf-8") as f:
        config = json.load(f)
    config_list = [config]

    consumer = PhotoConsumer(config_list)

    a = 1
