# wget

```sh
# 下载所有文件
wget -r -np -nH -R index.html -R index.html.tmp https://update.cs2c.com.cn/NS/V10/V10SP1.1/os/adv/lic/updates/x86_64/
wget -r -np -nH -R index.html -R index.html.tmp https://update.cs2c.com.cn/NS/V10/V10SP1.1/os/adv/lic/base/x86_64/

wget -r -np -R "index.html*" http://example.com/configs/.vim/
```

## Links

- [Using wget to recursively fetch a directory with arbitrary files in it](https://stackoverflow.com/questions/273743/using-wget-to-recursively-fetch-a-directory-with-arbitrary-files-in-it)
