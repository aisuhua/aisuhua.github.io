# PDF

## ghostscript

安装

```sh
sudo apt install ghostscript
```

压缩

```sh
# 按电子书比例压缩
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.0 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

# 自定义分辨率为 120 dpi
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution=120 \
    -dNOPAUSE  -dBATCH -sOutputFile=output.pdf input.pdf
```
参考

- [Reduce PDF File Size in Linux](https://www.digitalocean.com/community/tutorials/reduce-pdf-file-size-in-linux)
- [How can I reduce the file size of a scanned PDF file?](https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file)
