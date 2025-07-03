from dataclasses import dataclass, asdict, field
from pathlib import Path
from typing import Optional, Dict, Any
import json
import uuid
from datetime import datetime
import time
from PIL import Image

@dataclass
class PhotoMessage:
    """
    Represents a frame message in video streaming processing pipeline.
    Optimized for 1-frame-per-second video analysis scenarios.
    
    Attributes:
        photo_id: Unique identifier for the frame (UUID by default)
        camera_id: Source camera identifier
        room_id: Physical location identifier
        photo_path: Filesystem path or memory reference to the frame
        timestamp: Frame capture time (auto-generated if not provided)
        metadata: Additional processing context (model outputs, etc.)
    """
    camera_id: str
    room_id: str
    photo_path: Path
    photo_id: str = field(default_factory=lambda: str(uuid.uuid4()))
    timestamp: datetime = field(default_factory=datetime.now)
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_json(self) -> str:
        """Serialize to JSON with datetime handling"""
        def serializer(obj):
            if isinstance(obj, (datetime, Path)):
                return str(obj)
            raise TypeError(f"Type {type(obj)} not serializable")
        return json.dumps(asdict(self), default=serializer)

    @classmethod
    def from_json(cls, json_str: str) -> "PhotoMessage":
        """Deserialize from JSON with path conversion"""
        data = json.loads(json_str)
        return cls(
            photo_id=data['photo_id'],
            camera_id=data['camera_id'],
            room_id=data['room_id'],
            photo_path=Path(data['photo_path']),
            timestamp=datetime.fromisoformat(data['timestamp']),
            metadata=data.get('metadata', {})
        )

    def __str__(self) -> str:
        """Human-readable representation with path shortening"""
        short_path = str(self.photo_path).split('/')[-1]
        return (f"PhotoMessage(camera={self.camera_id}, room={self.room_id}, "
                f"frame={short_path}, time={self.timestamp:%H:%M:%S.%f})")

    @property
    def exists(self) -> bool:
        """Check if the referenced photo exists"""
        return self.photo_path.exists()
    

class DetectionResult:
    def __init__(self, ifwarning: bool = False, image: Image.Image = None, 
                 description: str = "", timestamp: Optional[float] = None, 
                 room_id: int = -999, camera_id: int = -999, alarm_category: str = "unknow"):
        # 初始化DetectionResult类，设置默认参数
        ifwarning = ifwarning
        self.image = image
        self.description = description
        self.timestamp = timestamp
        self.room_id = room_id
        self.camera_id = camera_id
        self.alarm_category = alarm_category


    def __repr__(self):
        return f"666"