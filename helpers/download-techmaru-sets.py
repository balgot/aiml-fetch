import requests
from bs4 import BeautifulSoup
from pprint import pprint
from tqdm import tqdm
from collections import defaultdict
import os
from pprint import pprint
import re

URL = "https://sites.google.com/a/techmaru.com/techmaruhome/technology/aiml-2-1"
NAMES = ["verb2sp", "verb2sp2verb1sp", "thirdperson_pronoun", "adjective uses", "verb_form"]

if __name__ == "__main__":
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    name = "NO NAME"
    sets = defaultdict(list)
    for name in NAMES:
        for e in soup.body.findAll(text=re.compile(f".*{re.escape(name)}.*")):
            p = e.parent
            while p.name != "p":
                p = p.parent
            
            def get_next(e):
                n = e.next_sibling
                if n.name == "p":
                    return n
                return n.next_sibling
            n = get_next(p) 
            try:
                def text(e):
                    fs = e.find("font").find("span")
                    sf = e.find("span").find("font")
                    if fs:
                        return fs.text.strip()
                    return sf.text.strip()
                while n and text(n) and " " not in text(n) and "<" not in text(n):
                    txt = text(n)
                    if name == "verb2sp" and ":" in txt:
                        break
                    sets[name].append(txt)
                    n = get_next(n)
            except:
                ...

    for k, v in sets.items():
        end = "set" if k != "verb2sp2verb1sp" else "map"
        filename = f"sets-techmaru/{k.replace(' ', '-')}.{end}"
        os.makedirs(os.path.dirname(filename), exist_ok=True)
        with open(filename, "w", encoding="utf-8") as f:
            f.write("\n".join(v))

