from typing import Optional
from dataclasses import asdict
import queue
import json
from pathlib import Path
from .photo_message import PhotoMessage  # 假设PhotoMessage在photo_message.py中

class GlobalMessageQueue():
    """
    线程安全的全局消息队列，专为PhotoMessage设计
    实现单例模式确保全局唯一队列
    """
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._queue = queue.LifoQueue(maxsize=10000)  # 防止内存溢出
            cls._instance._persist_file = None
        return cls._instance
    
    def put_message(self, msg: PhotoMessage) -> bool:
        """
        存入消息到队列
        :param msg: PhotoMessage实例
        :return: 是否成功入队
        """
        try:
            self._queue.put_nowait(msg)
            return True
        except queue.Full:
            print("WARNING: 消息队列已满，丢弃最早的消息")
            try:
                self._queue.get_nowait()  # 丢弃最旧消息
                self._queue.put_nowait(msg)
                return True
            except queue.Empty:
                return False
    
    def get_message(self) -> Optional[PhotoMessage]:
        """
        非阻塞获取消息
        :return: PhotoMessage实例或None
        """
        try:
            return self._queue.get_nowait()
        except queue.Empty:
            return None
    
    def persist_messages(self, file_path: Path) -> int:
        """
        持久化队列到磁盘
        :param file_path: 存储文件路径
        :return: 持久化的消息数量
        """
        count = 0
        with open(file_path, 'a', encoding='utf-8') as f:
            while not self._queue.empty():
                msg = self.get_message()
                if msg:
                    f.write(msg.to_json() + '\n')
                    count += 1
        return count
    
    def load_messages(self, file_path: Path) -> int:
        """
        从磁盘加载消息到队列
        :param file_path: 存储文件路径
        :return: 加载的消息数量
        """
        count = 0
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                for line in f:
                    msg = PhotoMessage.from_json(line.strip())
                    if msg and msg.exists:  # 只加载图片仍存在的消息
                        self.put_message(msg)
                        count += 1
        except FileNotFoundError:
            pass
        return count

    def set_persist_file(self, file_path: Path):
        """设置自动持久化文件路径"""
        self._persist_file = file_path

    def __del__(self):
        """析构时自动持久化"""
        if self._persist_file:
            self.persist_messages(self._persist_file)

    def size(self) -> int:
        """
        获取当前队列的大小
        :return: 队列中消息的数量
        """
        return self._queue.qsize()