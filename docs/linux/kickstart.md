# PXE 自动装机

## 通过 ISO 搭建软件源

```sh
# 挂载 ISO 到本地目录
mount rhel-server-7.9-x86_64-dvd.iso /opt/mirror/rhel79

# 配置 Nginx 能访问镜像源
root /opt/mirror/rhel79;
autoindex on
```

## 准备 Kickstart

```sh
# 配置 Nginx 能访问 ks.cfg
alias /opt/ks;
```

## 搭建 DHCP

```sh
# 安装 DHCP Server
sudo apt install isc-dhcp-server

## /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;
log-facility local7;
    
subnet 192.168.88.0 netmask 255.255.255.0 {
 range 192.168.88.100 192.168.88.200;
 next-server 192.168.88.66;
 filename "pxelinux/pxelinux.0";
}
```

## 搭建 TFTP

```sh
# 安装 tftp
sudo apt install tftpd-hpa

# 默认配置 /etc/default/tftpd-hpa

# 准备 pxelinux.0
cp /opt/mirror/rhel79/Packages/syslinux-4.05-15.el7.x86_64.rpm .
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv

mkdir /var/lib/tftpboot/pxelinux
cp usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/pxelinux

## 准备菜单文件
mkdir /var/lib/tftpboot/pxelinux/pxelinux.cfg



```
