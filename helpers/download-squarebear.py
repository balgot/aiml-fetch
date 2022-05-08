import requests
from bs4 import BeautifulSoup
from pprint import pprint
from tqdm import tqdm
import os
import shutil


URL = "http://www.square-bear.co.uk/aiml/"
SAVE_DIR = "./square-bear"
TMP_DIR = "./tmp"


def process_zip(filename):
    shutil.unpack_archive(filename, SAVE_DIR)
    os.remove(filename)


def all_paths():
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    results = soup.find_all("a")
    for a in results:
        if not "/aiml/" in a.attrs["href"]:
            continue
        yield a.attrs["href"]




if __name__ == "__main__":
    os.makedirs(SAVE_DIR, exist_ok=True)
    for f in all_paths():
        req = requests.get(f)
        *_, name = f.rsplit("/", 1)
        path = f"./{name}"
        print("Downloading...", name)
        with open(path, "wb") as zip_file:
            zip_file.write(req.content)
        process_zip(name)

