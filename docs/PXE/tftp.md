# TFTP

## 安装

```sh
sudo apt install tftpd-hpa
```

## 配置

开启文件传输日志

```sh
# /etc/default/tftpd-hpa
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure -vvv"
```

## 准备 PXE 环境

```sh
# 拷贝
mkdir -p /srv/tftp/pxelinux
mkdir -p /srv/tftp/pxelinux/pxelinux.cfg
mkdir -p /srv/tftp/pxelinux/images
```