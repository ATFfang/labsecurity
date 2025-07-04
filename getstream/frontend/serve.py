from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Dict
import asyncpg
import uvicorn

app = FastAPI()

# CORS 设置：允许前端访问
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 生产中建议限制为你页面的地址
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 数据库配置（与你 docker-compose 保持一致）
DB_CONFIG = {
    "user": "postgres",
    "password": "postgres",
    "database": "labcamera",
    "host": "localhost",
    "port": 5434
}

# 摄像头信息模型
class CameraInfo(BaseModel):
    id: str
    camera_id: str
    camera_name: str | None = None
    camera_status: int | None = None
    org_name: str | None = None

# 请求模型（用于获取RTSP）
class CameraRequest(BaseModel):
    camera_ids: List[str]

# 模拟 RTSP 生成函数
def generate_rtsp_url(camera_id: str) -> str:
    return f"rtsp://example.com/live/{camera_id}"

# 数据库查询
async def get_connection():
    return await asyncpg.connect(**DB_CONFIG)

# 获取所有摄像头
@app.get("/cameras", response_model=List[CameraInfo])
async def get_all_cameras():
    conn = await get_connection()
    try:
        rows = await conn.fetch("SELECT * FROM t_camera_info ORDER BY camera_name")
        return [dict(row) for row in rows]
    finally:
        await conn.close()

# 批量获取 RTSP 地址
@app.post("/get_rtsp_batch")
async def get_rtsp_batch(req: CameraRequest):
    result: Dict[str, str] = {}
    for cam_id in req.camera_ids:
        result[cam_id] = generate_rtsp_url(cam_id)
    return {"result": result}

# 启动命令（开发调试用）
if __name__ == "__main__":
    uvicorn.run("serve:app", host="0.0.0.0", port=8000, reload=True)
