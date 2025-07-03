# logger_config.py
import logging
from logging.handlers import RotatingFileHandler
import os
from datetime import datetime

now = datetime.now().strftime("%Y%m%d_%H%M%S")
log_file = f"log_{now}.log"
log_dir = "logs"
os.makedirs(log_dir, exist_ok=True)
log_path = os.path.join(log_dir, log_file)

# 全局配置
logging.basicConfig(
    level=logging.INFO,  # 可以是 DEBUG, INFO, WARNING, ERROR, CRITICAL
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    handlers=[
        RotatingFileHandler(log_path, maxBytes=5 * 1024 * 1024, backupCount=3, encoding='utf-8'),
        logging.StreamHandler()  # 控制台打印
    ]
)

# 获取通用 logger（主程序或根模块可用）
logger = logging.getLogger("main")


def log_start_info(username: str):
    start_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    logger.info("=" * 60)
    logger.info("📡  ECNU实验室安全检测系统 启动")
    logger.info("-" * 60)
    logger.info(f"👤 当前用户    ：{username}")
    logger.info(f"⏰ 启动时间    ：{start_time}")
    logger.info("-" * 60)
    logger.info("© 2025 Lab716 · All rights reserved")
    logger.info("=" * 60)