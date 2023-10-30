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
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/var/lib/tftpboot"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure"

# 准备 pxelinux.0
cp /opt/mirror/rhel79/Packages/syslinux-4.05-15.el7.x86_64.rpm .
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv

mkdir /var/lib/tftpboot/pxelinux
cp usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/pxelinux/
cp usr/share/syslinux/vesamenu.c32 /var/lib/tftpboot/pxelinux/

# RHEL
e28413b36fee074c30554f8c9e54ca2c  pxelinux.0
# Kylin V10
dc53ded43315e73f09234a2b88fce38c  pxelinux.0

# 准备内核文件
mkdkir -p /var/lib/tftpboot/pxelinux/images/rhel79/
cp /opt/mirror/rhel79/images/pxeboot/{vmlinuz,initrd.img} /var/lib/tftpboot/pxelinux/images/rhel79/

# 准备菜单文件
mkdir /var/lib/tftpboot/pxelinux/pxelinux.cfg
cp /opt/mirror/rhel79/isolinux/isolinux.cfg /var/lib/tftpboot/pxelinux/pxelinux.cfg/default

# 修改菜单文件
default linux
...
label linux
  menu label ^Install Red Hat Enterprise Linux 7.9
  menu default
  kernel images/rhel79/vmlinuz
  append initrd=images/rhel79/initrd.img ip=dhcp inst.ks=http://192.168.88.66/ks/ks.cfg quiet
...

# 目录结构
/var/lib/tftpboot/
└── pxelinux
    ├── images
    │   └── rhel79
    │       ├── initrd.img
    │       └── vmlinuz
    ├── pxelinux.0
    └── pxelinux.cfg
        └── default
```

## 其他

```sh
# 查看已分配的 IP
dhcp-lease-list

# 测试 DHCP Server
sudo nmap --script broadcast-dhcp-discover

# 测试 UDP 端口是否通
nmap 10.0.0.1 -sU -pU:69
```

## 参考文献

- [Installing and Configuring TFTP Server on Ubuntu](https://linuxhint.com/install_tftp_server_ubuntu/)
- [How to install and configure isc-dhcp-server](https://ubuntu.com/server/docs/how-to-install-and-configure-isc-dhcp-server)
- [01-自动化装机工具-kickstart](http://www.chrisjing.com/003-%E8%87%AA%E5%8A%A8%E5%8C%96%E8%A3%85%E6%9C%BA/01-%E8%87%AA%E5%8A%A8%E5%8C%96%E8%A3%85%E6%9C%BA%E5%B7%A5%E5%85%B7-kickstart/)
- [Need to set up yum repository for locally-mounted DVD on Red Hat Enterprise Linux 7](https://access.redhat.com/solutions/1355683)
- [27.3. Kickstart Syntax Reference](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax)
- [PXE部署实施](https://www.kancloud.cn/desktop/lv200/2665326)
- [Chapter 24. Preparing for a Network Installation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/chap-installation-server-setup)
- [How to set-up and configure a PXE Server](https://access.redhat.com/solutions/163253)
- [List Assigned DHCP IP Addresses](https://www.baeldung.com/linux/assigned-dhcp-ip-addresses)
- [How do I configure syslinux to boot immediately](https://unix.stackexchange.com/questions/32243/how-do-i-configure-syslinux-to-boot-immediately)
- [dhcp-relay custom log file](https://unix.stackexchange.com/questions/615461/dhcp-relay-custom-log-file)
- [Sample kickstart partition example (RAID, LVM, Multipath, Simple,..)](https://www.golinuxhub.com/2018/05/sample-kickstart-partition-example-raid/)
- [s14.运维自动化之系统部署 -- 实战案例：kickstart文件制作过程](https://juejin.cn/post/7136077266877939720)
- [Why does Red Hat Enterprise Linux 7.6 kickstart installation not create bond interfaces properly?](https://access.redhat.com/solutions/4000641)
- [虚拟机下面实现双网卡绑定<bond0>](https://blog.csdn.net/robertkun/article/details/16873961)
- [Linux: Create virtual network interface](https://linuxconfig.org/configuring-virtual-network-interfaces-in-linux)
- [Introduction to Linux interfaces for virtual networking](https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking#bridge)
