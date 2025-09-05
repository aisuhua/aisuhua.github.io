# PDF

## 压缩大小

```sh
# 安装
sudo apt install ghostscript

# 按电子书比例压缩
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.0 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

# 自定义分辨率为 120 dpi
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution=120 \
    -dNOPAUSE -dBATCH -sOutputFile=output.pdf input.pdf
```


## 其他

```sh
# 剪切文件
# And you can extract pages 1 - 5 of input.pdf by using the first-page and last-page flags, -f 1 -l 5,
pdfseparate -f 1 -l 5 input.pdf output-page%d.pdf
```

- [Split PDF document from command line in Linux?](https://superuser.com/questions/345086/split-pdf-document-from-command-line-in-linux)


参考

- [Reduce PDF File Size in Linux](https://www.digitalocean.com/community/tutorials/reduce-pdf-file-size-in-linux)
- [How can I reduce the file size of a scanned PDF file?](https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file)
- https://www.ilovepdf.com/
