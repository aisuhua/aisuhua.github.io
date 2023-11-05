# TFTP

快速操作指引，以下操作在 Ubuntu 20.04 下进行

## 安装所需软件

```sh
sudo apt install tftpd-hpa isc-dhcp-server nginx
```

## 下载操作系统 ISO 镜像

```sh
rhel-server-7.9-x86_64-dvd.iso
rhel-8.3-x86_64-dvd.iso
Kylin-Server-10-SP1-Release-Build20-20210518-x86_64.iso
Kylin-Server-10-SP2-x86-Release-Build09-20210524.iso
```

## 制作本地源

以制作 RHEL 7.9 本地源为例，其他发行版做法类似 

```sh
# 创建 iso 临时挂在目录
mkdir -p /mnt/{rhel79,rhel83,v10sp1,v10sp2}
```