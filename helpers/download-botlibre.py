import requests
from bs4 import BeautifulSoup
from pprint import pprint
from tqdm import tqdm


URL = "https://botlibre.com/script?instance-sort=MonthlyConnects"
SAVE_DIR = "botlibre"

options = {
   "instance-filter": ["public"],
   "category-filter": ["AIML"],
   "content-rating": ["Teen", "Mature"],
   "page": list(map(str, range(5)))
}

FILE_LINK = "https://sandbox.botlibre.com/script?file&id="


def _iter_url_rec(keys: list, path: list):
    if not keys:
        yield "&".join(path)
        return
    key = keys.pop()
    for value in options[key]:
        option = f"{key}={value}"
        path.append(option)
        yield from _iter_url_rec(keys, path)
        path.pop()
    keys.append(key)


def iter_urls():
    keys = list(options.keys())
    yield from _iter_url_rec(keys, [URL])


def file_ids(url: str):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")
    ids = set()
    results = soup.find_all("a", class_="menu")

    for res in results:
        if "href" not in res.attrs or  "id=" not in res.attrs["href"]:
            continue
        _, doc_id = res.attrs["href"].rsplit(sep="id=", maxsplit=1)
        ids.add(doc_id)

    return ids


def download(file_id: str):
    page = requests.get(FILE_LINK + file_id)
    if not page.text.startswith("<?xml"):
        return
    filename = f"./{SAVE_DIR}/{file_id}.aiml"
    with open(filename, "wb") as f:
        f.write(page.content)


if __name__ == "__main__":
    import os
    os.makedirs(SAVE_DIR, exist_ok=True)
    all_urls = tqdm(list(iter_urls()))
    for url in all_urls:
        for file_id in file_ids(url):            
            all_urls.set_description(f"Processing {file_id}.aiml")
            download(file_id)


