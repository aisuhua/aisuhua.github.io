# Python

## cheetsheet

```sh
# 获取当前时间
now = datetime.datetime.now()

# 获取 15 分钟前的时间
datetime.datetime.now() - datetime.timedelta(minutes = 15)
```

## 下载 google fonts

```python
import requests

with open("example.css", "r") as f:
    text = f.read()
    urls = re.findall(r'(https?://[^\)]+)', text)

for url in urls:
    filename = url.split("/")[-1]
    r = requests.get(url)
    with open("./fonts/" + filename, "wb") as f: 
        f.write(r.content)
    text = text.replace(url, "/fonts/" + filename)

with open("example.css", "w") as f:
        f.write(text)
```

## Links

- [How to create a DateTime equal to 15 minutes ago?](https://stackoverflow.com/questions/4541629/how-to-create-a-datetime-equal-to-15-minutes-ago)
- [Downloading a Google font and setting up an offline site that uses it](https://stackoverflow.com/a/49838352)
- [google-font-dl.py](https://gist.github.com/aisuhua/ad5f3f112e88925b5688a48b204ab136)
