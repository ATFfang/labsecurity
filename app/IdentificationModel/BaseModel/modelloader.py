# model_loader.py
import torch
from torchvision.models import mobilenet_v2
from ultralytics import YOLO
from PIL import Image
import torchvision.transforms as transforms
import cv2
import sys
from pathlib import Path
import time
import datetime

# 添加父路径，确保可导入全局模块
current_file = Path(__file__).resolve()
parent_dir = current_file.parent.parent
sys.path.insert(0, str(parent_dir))

from MessageQueues import *
from FrameProcessor import global_mq
from Log import logger

class ModelLoader:
    @staticmethod
    def _load_mobilenet_v2(model_path, device):
        model = mobilenet_v2(weights=None)
        model.classifier[1] = torch.nn.Linear(model.last_channel, 2)
        model.load_state_dict(torch.load(model_path, map_location=device))
        model.to(device)
        model.eval()
        return model
    
    @staticmethod
    def _classify_person(img_crop, model, transform, device):
        img_pil = Image.fromarray(img_crop)
        img_tensor = transform(img_pil).unsqueeze(0).to(device)
        with torch.no_grad():
            output = model(img_tensor)
            pred = torch.argmax(output, dim=1).item()
        return pred
    
    @staticmethod
    def _load_coatdetecter(model_pipline, device):

        print("初始化白大褂检测模型")
        yolo_path = model_pipline[0]["weight_path"]
        mobilenet_path = model_pipline[1]["weight_path"]

        yolo_model = YOLO(yolo_path).to(device)
        mobilenet_model = ModelLoader._load_mobilenet_v2(mobilenet_path, device)

        transfrom = transforms.Compose([
            transforms.Resize((224, 224)),
            transforms.ToTensor(),
            transforms.Normalize([0.5] * 3, [0.5] * 3)
        ])


        def predict(message: PhotoMessage, image: Image.Image) -> DetectionResult:
            start_time = time.time()
            image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            yolo_result = yolo_model(image_rgb)[0]

            total_people = 0
            wearing_coat = 0
            not_wearing_coat = 0

            for box in yolo_result.boxes:
                cls_id = int(box.cls[0].item())
                conf = float(box.conf[0].item())
                if cls_id != 0 or conf < 0.3:
                    continue

                x1, y1, x2, y2 = map(int, box.xyxy[0].tolist())
                crop = image_rgb[y1:y2, x1:x2]
                if crop.size == 0:
                    continue

                # nonlocal transfrom
                pred = ModelLoader._classify_person(crop, mobilenet_model, transfrom, device)
                
                color = (0, 255, 0) if pred == 0 else (0, 0, 255)
                label = f"{'Wearing' if pred == 0 else 'Not wearing'} ({conf:.2f})"
                cv2.rectangle(image, (x1, y1), (x2, y2), color, 2)
                cv2.putText(image, label, (x1, y1 - 10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.7, color, 2)
                
                total_people += 1
                if pred == 0:
                    wearing_coat += 1
                else:
                    not_wearing_coat += 1

                description = f"Total people{total_people} and Not wearing coat people{not_wearing_coat}"
            
            if not_wearing_coat > 0:
                try:
                    image_pil = Image.fromarray(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
                    result = DetectionResult(ifwarning=True, 
                                             image=image_pil, 
                                             description=description, 
                                            #  timestamp=message.timestamp.timestamp(), 
                                            timestamp=message.timestamp,
                                             room_id=message.room_id, 
                                             camera_id=message.camera_id, 
                                             alarm_category="coat")

                except Exception as e:
                    logger.error(f"Error occurred while creating DetectionResult: {e}")
                    logger.exception("Error occurred while creating DetectionResult") # 打印堆栈信息
                    logger.info(image_pil, description, message.timestamp.timestamp(), message.room_id, message.camera_id, "coat")
                    result = None
            else:
                result = None

            end_time = time.time()
            duration_time = end_time - start_time
            logger.info(f"{datetime.datetime.now()}，{message.room_id}号房间{message.camera_id}号摄像头检测出{not_wearing_coat}人未穿 **coat** 任务执行完成，运行时间为：{duration_time}")
            return result
                
        return predict
    
    @staticmethod
    def _load_nightsingledetecter(model_pipline, device):
        print("初始化夜间单人做实验检测模型")
        yolo_path = model_pipline[0]["weight_path"]
        yolo_model = YOLO(yolo_path).to(device)
        
        
        def predict(message: PhotoMessage, image: Image.Image) -> DetectionResult:
            start_time = time.time()
            
            try: 
                image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
                yolo_result = yolo_model(image_rgb)[0]
                
                total_people = 0
                
                for box in yolo_result.boxes:
                    cls_id = int(box.cls[0].item())
                    conf = float(box.conf[0].item())
                    if cls_id != 0 or conf < 0.3:
                        continue
                    
                    x1, y1, x2, y2 = map(int, box.xyxy[0].tolist())
                    crop = image_rgb[y1:y2, x1:x2]
                    if crop.size == 0:
                        continue
                    
                    color = (0, 255, 0)
                    
                    label = f"{'Person'} ({conf:.2f})"
                    cv2.rectangle(image, (x1, y1), (x2, y2), color, 2)
                    cv2.putText(image, label, (x1, y1 - 10),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.7, color, 2)
                
                    total_people += 1
                    
                if True and total_people <= 5:
                    description = f"Total people{total_people} in night"
                    try:
                        image_pil = Image.fromarray(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
                        result = DetectionResult(ifwarning=True, 
                                                image=image_pil, 
                                                description=description, 
                                                #  timestamp=message.timestamp.timestamp(), 
                                                timestamp=message.timestamp,
                                                room_id=message.room_id, 
                                                camera_id=message.camera_id, 
                                                alarm_category="nightsingle")

                    except Exception as e:
                        logger.error(f"Error occurred while creating DetectionResult: {e}")
                        logger.exception("Error occurred while creating DetectionResult") # 打印堆栈信息
                        logger.info(image_pil, description, message.timestamp.timestamp(), message.room_id, message.camera_id, "coat")
                        result = None
                        
                    end_time = time.time()
                    duration_time = end_time - start_time
                    logger.info(f"{datetime.datetime.now()}，{message.room_id}号房间{message.camera_id}号摄像头检测出夜间一人做实验，运行时间为：{duration_time}")
                    
                    return result
            
            except Exception as e:
                logger.error(f"Error occurred while creating DetectionResult: {e}")
                logger.exception("Error occurred while creating DetectionResult") # 
                
                return None
            
        return predict
                    
    @staticmethod
    def loader(model_name, model_pipline, device):
        
        MODEL_MAP = {
            "coatdetecter": ModelLoader._load_coatdetecter,
            "nightsingledetecter": ModelLoader._load_nightsingledetecter
        }

        try:
            return MODEL_MAP[model_name](model_pipline, device)
        except KeyError:
            raise ValueError(f"Model '{model_name}' is not supported.")
