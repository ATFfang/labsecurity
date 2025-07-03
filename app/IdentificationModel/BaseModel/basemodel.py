from typing import Any, Dict, List
from pathlib import Path
import torch
import torchvision.transforms as T
from PIL import Image
import json
from .modelloader import ModelLoader
import sys
from types import MethodType
import cv2
import numpy as np
import time

current_file = Path(__file__).resolve()
parent_dir = current_file.parent.parent
grand_dir = parent_dir.parent
sys.path.insert(0, str(parent_dir))
sys.path.insert(0, str(grand_dir))

from MessageQueues import GlobalMessageQueue, PhotoMessage

# -------------------- 父类 --------------------
class BaseModel():
    def __init__(self, config: Dict[str, Any]):
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.name = config["name"]
        self.preprocess = config["preprocess"]
        self.pipeline = config["pipeline"]

        self._build_preprocess_method()

    # 预处理类
    def _build_preprocess_method(self):
        preprocess = self.preprocess

        def preprocess_image(self, message: PhotoMessage):
            image = Image.open(message.photo_path).convert("RGB")

            # 裁剪和缩放不能同时进行
            if preprocess.get("ifmask", False):
                image = self._crop(message, image)

            elif preprocess.get("ifresize", False):
                image = self._resize(message, image)

            image = np.array(image) 
            image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)

            return image
        
        self.preprocess_image = MethodType(preprocess_image, self)

    def _crop(self, message: PhotoMessage, image: Image.Image):
        if message.camera_id in self.preprocess["camera_settings"].keys():
            pass

        return image
    
    def _resize(self, message: PhotoMessage, image: Image.Image):
        return image.resize(self.preprocess["size"])
    

# -------------------- 子类1 --------------------
class IdentificationModel(BaseModel):
    def __init__(self, config: Dict[str, Any]):
        super().__init__(config)
        self.predict = self._loadmodel()

    def _loadmodel(self):
        predict = ModelLoader.loader(self.name, self.pipeline, self.device)
        return predict



if __name__ == "__main__":

    image_path = Path("E:\Project\Commercial\保卫处项目\Model\MessageQueues\photo\cam_001_1746773802.jpg")
    message = PhotoMessage(
        camera_id="cam01",
        room_id="roomA",
        photo_path=image_path
    )
    
    with open(r"E:\Project\Commercial\保卫处项目\Model\IdentificationModel\BaseModel\singleconfig.json", "r", encoding="utf-8") as f:
        config = json.load(f)
        singlemodel = IdentificationModel(config)
        # singlemodel
        p = singlemodel.preprocess_image(message)

        start_time = time.time()
        p2 = singlemodel.predict(p)
        end_time = time.time()

        print("识别时间：", end_time - start_time)
        cv2.imshow("image", cv2.cvtColor(np.array(p2.image), cv2.COLOR_RGB2BGR))
        
        a = 1



