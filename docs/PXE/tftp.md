# TFTP

## 安装

```sh
sudo apt install tftpd-hpa
```

## 配置

记录传输日志

```sh
# /etc/default/tftpd-hpa
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure -vvv"
```

## 准备 PXE 所需的文件

只支持 BIOS 方式启动所需的文件

```sh
# 准备 pxelinux.0 和 vesamenu.c32 文件
cp /var/www/html/rhel79/x86_64/base/Packages/syslinux-4.05-15.el7.x86_64.rpm .
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv
mkdir /srv/tftp/pxelinux
cp usr/share/syslinux/pxelinux.0 /srv/tftp/pxelinux/
cp usr/share/syslinux/vesamenu.c32 /srv/tftp/pxelinux/

# 准备 vmlinuz 和 initrd.img 文件
mkdir -p /srv/tftp/pxelinux/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/vmlinuz /srv/tftp/pxelinux/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/initrd.img /srv/tftp/pxelinux/images/rhel79

# 准备 default 文件
mkdir /srv/tftp/pxelinux/pxelinux.cfg
vim /srv/tftp/pxelinux/pxelinux.cfg/default

default vesamenu.c32
timeout 600

label local
  menu label Boot from ^local drive
  menu default
  localboot 0xffff

label rhel79
  menu label ^Install Red Hat Enterprise Linux 7.9
  kernel images/rhel79/vmlinuz
  append initrd=images/rhel79/initrd.img inst.ks=http://192.168.91.39/ks/rhel79.ks quiet

label rhel83
  menu label ^Install Red Hat Enterprise Linux 8.3
  kernel images/rhel83/vmlinuz
  append initrd=images/rhel83/initrd.img inst.ks=http://192.168.91.39/ks/rhel83.ks quiet

label v10sp1
  menu label ^Install Kylin Linux Advanced Server V10 SP1
  kernel images/v10sp1/vmlinuz
  append initrd=images/v10sp1/initrd.img inst.ks=http://192.168.91.39/ks/v10sp1.ks quiet

label v10sp2
  menu label ^Install Kylin Linux Advanced Server V10 SP2
  kernel images/v10sp2/vmlinuz
  append initrd=images/v10sp2/initrd.img inst.ks=http://192.168.91.39/ks/v10sp2.ks quiet

# 最终目录结构如下
/srv/tftp
└── pxelinux
    ├── images
    │   ├── rhel79
    │   │   ├── initrd.img
    │   │   └── vmlinuz
    │   ├── rhel83
    │   │   ├── initrd.img
    │   │   └── vmlinuz
    │   ├── v10sp1
    │   │   ├── initrd.img
    │   │   └── vmlinuz
    │   └── v10sp2
    │       ├── initrd.img
    │       └── vmlinuz
    ├── pxelinux.0
    ├── pxelinux.cfg
    │   └── default
    └── vesamenu.c32
```

## 查看日志

```sh
sudo tail -f /var/log/syslog | grep tftp
```