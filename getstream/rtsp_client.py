import requests
import base64
import hashlib
import time
import yaml


class RTSPClient:
    def __init__(self, config):
        self.server_ip = config["server_ip"]
        self.username = config["username"]
        self.password = config["password"]
        self.camera_ids = config["camera_ids"]
        self.stream_type = config.get("stream_type", 1)
        self.channel_num = config.get("channel_num", 1)
        self.base_url = f"http://{self.server_ip}:8088"
        self.token = ""
        self.keep_alive_interval = 30

    def login(self):
        # Step 1: Get AccessCode
        res = requests.post(f"{self.base_url}/VIID/login/v2")
        access_code = res.json().get("AccessCode")
        if not access_code:
            raise Exception("登录失败：未获取到AccessCode")

        # Step 2: Use AccessCode to get token
        encoded_user = base64.b64encode(self.username.encode()).decode()
        hashed_pwd = hashlib.md5(self.password.encode()).hexdigest()
        login_signature = hashlib.md5(f"{encoded_user}{access_code}{hashed_pwd}".encode()).hexdigest()

        payload = {
            "UserName": self.username,
            "AccessCode": access_code,
            "LoginSignature": login_signature
        }

        res = requests.post(f"{self.base_url}/VIID/login/v2", json=payload)
        data = res.json()
        if "AccessToken" in data:
            self.token = data["AccessToken"]
            print("✅ 登录成功")
        else:
            raise Exception(f"登录失败：{data.get('ErrMsg')}")

    def keep_alive(self):
        if not self.token:
            print("⚠️ 未登录，跳过保活")
            return

        res = requests.post(
            f"{self.base_url}/VIID/hadesadapter/user/keepalive",
            headers={"Authorization": self.token}
        )
        data = res.json()
        print(f"🔁 保活：ErrCode={data.get('ErrCode')}, ErrMsg={data.get('ErrMsg')}")

    def register_channel(self):
        if not self.token:
            raise Exception("未登录，无法注册播放通道")

        payload = {"Num": self.channel_num}
        res = requests.post(
            f"{self.base_url}/VIID/live/player/build",
            json=payload,
            headers={"Authorization": self.token}
        )
        data = res.json()
        if data.get("ErrCode") == 0:
            print("✅ 注册播放通道成功")
        else:
            print(f"❌ 通道注册失败: {data}")

    def get_rtsp_url(self, camera_id):
        if not self.token:
            raise Exception("未登录，无法获取RTSP")

        payload = {
            "CameraCode": camera_id,
            "StreamType": self.stream_type
        }

        res = requests.post(
            f"{self.base_url}/VIID/live/start",
            json=payload,
            headers={"Authorization": self.token}
        )
        data = res.json()
        if data.get("ErrCode") == 0:
            rtsp_url = data["Result"]["RtspURL"]
            print(f"🎥 摄像头 {camera_id} RTSP: {rtsp_url}")
            return rtsp_url
        else:
            print(f"❌ 获取RTSP失败: 摄像头 {camera_id}, ErrMsg: {data.get('ErrMsg')}")
            return None

    def logout(self):
        if self.token:
            res = requests.post(
                f"{self.base_url}/VIID/logout",
                headers={"Authorization": self.token}
            )
            print("🔚 登出结果：", res.json())
        self.token = ""

