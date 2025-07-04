import threading
import tkinter as tk
from tkinter import messagebox
import getpass

from FrameProcessor import run_all_streams, run_all_local_videos
from IdentificationModel import start_photo_consumer, start_photo_consumer_concurrent
from Log import logger, log_start_info


def start_with_mode(mode, concurrent = False):
    """根据选择的模式启动线程"""
    username = getpass.getuser()
    log_start_info(username)

    if not concurrent:
        consumer_thread = threading.Thread(target=start_photo_consumer)

        if mode == 'stream':
            stream_thread = threading.Thread(target=run_all_streams)
        elif mode == 'local':
            stream_thread = threading.Thread(target=run_all_local_videos)
        else:
            messagebox.showerror("错误", "未知模式")
            return

        # 启动线程
        stream_thread.start()
        consumer_thread.start()

        # 等待线程结束
        stream_thread.join()
        consumer_thread.join()
        
    else:
        consumer_thread = threading.Thread(target=start_photo_consumer_concurrent)

        if mode == 'stream':
            stream_thread = threading.Thread(target=run_all_streams)
        elif mode == 'local':
            stream_thread = threading.Thread(target=run_all_local_videos)
        else:
            messagebox.showerror("错误", "未知模式")
            return

        # 启动线程
        stream_thread.start()
        consumer_thread.start()

        # 等待线程结束
        stream_thread.join()
        consumer_thread.join()
        


def launch_gui():
    """创建图形界面"""
    window = tk.Tk()
    window.title("视频流处理模式选择")
    window.geometry("300x200")

    label = tk.Label(window, text="请选择启动模式：", font=("Arial", 14))
    label.pack(pady=20)

    stream_btn = tk.Button(window, text="直播视频流", width=20, command=lambda: launch_and_destroy(window, 'stream'))
    stream_btn.pack(pady=10)

    local_btn = tk.Button(window, text="读取本地视频", width=20, command=lambda: launch_and_destroy(window, 'local'))
    local_btn.pack(pady=10)

    window.mainloop()


def launch_and_destroy(window, mode):
    window.destroy()
    start_with_mode(mode)


if __name__ == '__main__':
    start_with_mode('stream',concurrent = True)
    # launch_gui()
