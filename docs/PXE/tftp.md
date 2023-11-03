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
# 准备 pxelinux.0 和 vesamenu.c32 文件
cp /opt/www/mirror/rhel79/x86_64/base/Packages/syslinux-4.05-15.el7.x86_64.rpm .
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv
mkdir -p /srv/tftp/pxelinux
usr/share/syslinux/pxelinux.0 /srv/tftp/pxelinux/
cp usr/share/syslinux/vesamenu.c32 /srv/tftp/pxelinux/

# 
mkdir -p /srv/tftp/pxelinux/pxelinux.cfg
mkdir -p /srv/tftp/pxelinux/images


```