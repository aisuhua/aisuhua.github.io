# PDF

```sh
# 压缩大小
sudo apt install ghostscript
# 按电子书比例压缩
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.0 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
# 自定义分辨率为 120 dpi
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dDownsampleColorImages=true -dColorImageResolution=120 \
    -dNOPAUSE -dBATCH -sOutputFile=output.pdf input.pdf

# 去掉密码
apt install qpdf
qpdf --password=secret --decrypt original.pdf decrypted.pdf

# 分割文件
# And you can extract pages 1 - 5 of input.pdf by using the first-page and last-page flags, -f 1 -l 5,
pdfseparate -f 1 -l 5 input.pdf output-page%d.pdf

# 图片转 PDF
sudo apt install imagemagick
sudo vi /etc/ImageMagick-6/policy.xml
# 将配置改成 read|write
<policy domain="coder" rights="read|write" pattern="PDF" />
# 将多张图片合并成 PDF
convert image1.jpg image2.png output.pdf
```

参考

- [Reduce PDF File Size in Linux](https://www.digitalocean.com/community/tutorials/reduce-pdf-file-size-in-linux)
- [How can I reduce the file size of a scanned PDF file?](https://askubuntu.com/questions/113544/how-can-i-reduce-the-file-size-of-a-scanned-pdf-file)
- https://www.ilovepdf.com/
- [Split PDF document from command line in Linux?](https://superuser.com/questions/345086/split-pdf-document-from-command-line-in-linux)
- [Linux上将图片、word转换为PDF和PDF合并](https://blog.csdn.net/qq_45362336/article/details/140247367)
