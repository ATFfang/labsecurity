import yaml
import time
from rtsp_client import RTSPClient


def load_config(path="config.yaml"):
    with open(path, 'r', encoding='utf-8') as f:
        return yaml.safe_load(f)


if __name__ == "__main__":
    config = load_config()
    client = RTSPClient(config)

    try:
        client.login()
        client.keep_alive()
        client.register_channel()

        print("\n📡 获取RTSP地址：")
        for camera_id in config["camera_ids"]:
            client.get_rtsp_url(camera_id)
            time.sleep(1)

        print("\n⏳ 模拟保活3次...")
        for _ in range(3):
            time.sleep(client.keep_alive_interval)
            client.keep_alive()

    except Exception as e:
        print("❌ 错误:", e)

    finally:
        client.logout()
