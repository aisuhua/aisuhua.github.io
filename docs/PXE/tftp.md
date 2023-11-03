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
cp /var/www/html/rhel79/x86_64/base/Packages/syslinux-4.05-15.el7.x86_64.rpm .
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv
mkdir /srv/tftp/pxelinux
usr/share/syslinux/pxelinux.0 /srv/tftp/pxelinux/
cp usr/share/syslinux/vesamenu.c32 /srv/tftp/pxelinux/

# 准备 vmlinuz 和 initrd.img 文件
mkdir -p /srv/tftp/pxelinux/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/vmlinuz /srv/tftp/pxelinux/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/initrd.img /srv/tftp/pxelinux/images/rhel79

mkdir -p /srv/tftp/pxelinux/pxelinux.cfg



```