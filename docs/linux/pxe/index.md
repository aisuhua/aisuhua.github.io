# PXE

## 安装所需的软件

DHCP、TFTP 和 Nginx

```sh
sudo apt install isc-dhcp-server tftpd-hpa nginx
```

## 操作系统 ISO

操作系统 ISO 文件，从官方下载即可。如我们下载了 RHEL7/8 和 Kylin V10 SP1/SP2

```sh
rhel-server-7.9-x86_64-dvd.iso
rhel-8.3-x86_64-dvd.iso
Kylin-Server-10-SP1-Release-Build20-20210518-x86_64.iso
Kylin-Server-10-SP2-x86-Release-Build09-20210524.iso
```

## Kickstart

可以手工安装好操作系统后，从 /root/anaconda-ks.cfg 得到，然后按需进行自定义即可。

## 制作镜像源

```
mkdir -p /opt/www/mirror/rhel79/base/x86_64
mkdir -p /opt/www/mirror/rhel83/base/x86_64
mkdir -p /opt/www/mirror/v10sp1/base/x86_64
mkdir -p /opt/www/mirror/v10sp2/base/x86_64
```





