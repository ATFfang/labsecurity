from .postsqlConnect import Database
import io
from PIL import Image
from io import BytesIO
from minio import Minio
import uuid

import sys
from pathlib import Path

# 添加父路径，确保可导入全局模块
current_file = Path(__file__).resolve()
parent_dir = current_file.parent.parent
sys.path.insert(0, str(parent_dir))

from MessageQueues import *

class DataSaver:
    def __init__(self):
        self.db = Database(name = "labcamera",
                           username = "postgres",
                           password = "postgres",
                           host = "localhost",
                           port = "5434")
        
        self.db.connect()

        self.client = Minio(
            "localhost:9000",
            access_key="minioadmin",
            secret_key="minioadmin",
            secure=False 
        )
        self.bucket_name = "detection-results"

    def insert(self, result: DetectionResult):
        file_uuid = str(uuid.uuid4())
        
        # 构造 SQL 插入语句
        sql = """
            INSERT INTO t_results_whitecoat (timestamp, room_id, camera_id, alarm_category, photo, message)
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        values = (
            result.timestamp,
            result.room_id,
            result.camera_id,
            result.alarm_category,
            file_uuid,
            result.description
        )

        # 执行插入
        self.db.post_cursor.execute(sql, values)
        self.db.post_conn.commit()

        object_name = f"{file_uuid}.jpg"

        # 将 PIL 图片转为字节流
        buffer = BytesIO()
        result.image.save(buffer, format="JPEG")
        buffer.seek(0)

        self.client.put_object(self.bucket_name, object_name, buffer, length=len(buffer.getvalue()), content_type="image/jpeg")


    def select(self):
        self.db.post_cursor.execute("SELECT photo FROM t_results_whitecoat WHERE id = 2")
        result = self.db.post_cursor.fetchone()
        if result and result[0]:
            img_bytes = result[0]
            image = Image.open(io.BytesIO(img_bytes))
            image.show()  # 或 image.save("output.jpg")
        else:
            print("没有图片数据")


if __name__ == '__main__':

    db = DataSaver()
    # db.insert(det_result)
    db.select()