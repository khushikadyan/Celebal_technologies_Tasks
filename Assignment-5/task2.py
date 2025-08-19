import schedule
import time
import datetime
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from utils import run_pipeline

WATCH_DIR = "exported_data"

class FileArrivalHandler(FileSystemEventHandler):
    def on_created(self, event):
        if not event.is_directory and event.src_path.endswith(".csv"):
            print(f"[{datetime.datetime.now()}] File arrived: {event.src_path}")
            run_pipeline()

def start_automation():
    schedule.every().day.at("02:00").do(run_pipeline)

    observer = Observer()
    observer.schedule(FileArrivalHandler(), path=WATCH_DIR, recursive=False)
    observer.start()

    print("Automation running: scheduled + file-watcher enabled.")
    try:
        while True:
            schedule.run_pending()
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
        observer.join()
        print("Automation stopped.")

if __name__ == "__main__":
    start_automation()
