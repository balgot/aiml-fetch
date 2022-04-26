import requests
from bs4 import BeautifulSoup
from pprint import pprint
from tqdm import tqdm
import os



URLS = {
    "italian": "http://alicebot.wikidot.com/aiml:it-it:sandro:maria",
    "portuguese": "http://alicebot.wikidot.com/aiml:pt-br:cybernet:cybora",
    "japanse": "http://alicebot.wikidot.com/aiml:adv",
    "square-bear": "http://alicebot.wikidot.com/aiml:en-uk:square-bear",
    "chomsky": "http://alicebot.wikidot.com/aiml:en-uk:plafferty:chomsky"
}


def all_paths(url: str):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")
    results = soup.find("div", id="page-content").find("ol").find_all("a")

    url_paths = []

    for res in results:
        if "href" not in res.attrs:
            continue
        u, p = url.rsplit("/", 1)
        url_paths.append(u + res.attrs["href"])

    return url_paths


def download_file(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.content, "html.parser")
    pre = soup.find_all("pre")
    assert len(pre) == 1
    content = []
    for span in pre[0]:
        content.append(span.text)
    return "".join(content)


if __name__ == "__main__":
    for key, val in URLS.items():
        print(key, val)
        paths = all_paths(val)
        for i, p in enumerate(paths):
            try:
                content = download_file(p)
                filename = f"{key}/{i}.aiml"
                print(filename, p)
                os.makedirs(os.path.dirname(filename), exist_ok=True)
                with open(filename, "w", encoding="utf-8") as f:
                    f.write(content)
            except:
                ...
