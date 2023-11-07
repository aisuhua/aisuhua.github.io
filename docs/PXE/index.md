# TFTP

快速操作指引，以下操作在 Ubuntu 20.04 下进行

## 安装所需软件

```sh
apt install tftpd-hpa isc-dhcp-server nginx
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
mkdir -p /mnt/rhel79
mount rhel-server-7.9-x86_64-dvd.iso /mnt/rhel79
mkdir -p /var/www/html/rhel79/x86_64 
cp -r /mnt/rhel79 /var/www/html/rhel79/x86_64/base

$ sudo vim /etc/nginx/sites-enabled/default
server {
  listen 80 default_server;
  root /var/www/html;
  autoindex on;
}
```

## 制作 Kickstart 文件

可以先手工安装好操作系统后，从 `/root/anaconda-ks.cfg` 获取到该文件

```sh
mkdir /var/www/html/kickstart
cp rhel79.cfg /var/www/html/kickstart/

# 最终目录结构如下
/var/www/html
├── kickstart
│   ├── cdh.cfg
│   ├── gbase.cfg
│   ├── rhel79.cfg
│   ├── v10sp1.cfg
│   └── v10sp2.cfg
├── rhel79
│   └── x86_64
│       ├── addons
│       ├── base
│       └── updates
├── rhel83
│   └── x86_64
│       ├── addons
│       ├── base
│       └── updates
├── rhel84
│   └── x86_64
│       ├── addons
│       ├── base
│       └── updates
├── v10sp1
│   └── x86_64
│       ├── addons
│       ├── base
│       └── updates
└── v10sp2
    └── x86_64
        ├── addons
        ├── base
        └── updates
```

## 配置 DHCP 

注意：先将本机 IP 配置成 `10.0.0.1`

```sh
$ sudo vim /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;
log-facility local7;

option arch code 93 = unsigned integer 16;

subnet 10.0.0.0 netmask 255.255.255.0 {
  range 10.0.0.10 10.0.0.50;
  next-server 10.0.0.1;

  class "pxeclients" {
    match if substring (option vendor-class-identifier, 0, 9) = "PXEClient";

    if option arch = 00:07 or option arch = 00:09 {
      # x86-64 EFI BIOS
      filename "efi/x86_64/BOOTX64.EFI";
    } else if option arch = 00:0b {
      # ARM64 aarch64 EFI BIOS
      filename "efi/aarch64/BOOTAA64.EFI";
    } else {
      # Legacy non-EFI BIOS
      filename "bios/x86_64/pxelinux.0";
    }
  }
}

$ sudo vim /etc/rsyslog.d/dhcp-relay.conf
local7.* -/var/log/dhcp-relay.log

# 重启服务
systemctl restart isc-dhcp-server
```

## 配置 TFTP

```sh
$ sudo vim /etc/default/tftpd-hpa
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/srv/tftp"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure -vvv"

# 创建 BIOS 目录
mkdir -p /srv/tftp/bios/x86_64

# 准备 pxelinux.0 和 vesamenu.c32 文件
cp /var/www/html/rhel79/x86_64/base/Packages/syslinux-4.05-15.el7.x86_64.rpm .
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv
cp usr/share/syslinux/pxelinux.0 /srv/tftp/bios/x86_64/
cp usr/share/syslinux/vesamenu.c32 /srv/tftp/bios/x86_64/

# 准备 vmlinuz 和 initrd.img 文件
mkdir -p /srv/tftp/bios/x86_64/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/vmlinuz //srv/tftp/bios/x86_64/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/initrd.img /srv/tftp/bios/x86_64/images/rhel79

# 准备 default 文件
mkdir /srv/tftp/bios/x86_64/pxelinux.cfg
cp /var/www/html/rhel79/x86_64/base/isolinux/isolinux.cfg /srv/tftp/bios/x86_64/pxelinux.cfg/default
$ sudo vim /srv/tftp/bios/x86_64/pxelinux.cfg/default
default vesamenu.c32
timeout 600

label local
  menu label Boot from ^local drive
  menu default
  localboot 0xffff

label rhel79
  menu label ^Install Red Hat Enterprise Linux 7.9
  kernel images/rhel79/vmlinuz
  append initrd=images/rhel79/initrd.img inst.ks=http://10.0.0.1/kickstart/rhel79.cfg quiet

label rhel83
  menu label ^Install Red Hat Enterprise Linux 8.3
  kernel images/rhel83/vmlinuz
  append initrd=images/rhel83/initrd.img inst.ks=http://10.0.0.1/kickstart/rhel83.cfg quiet

label v10sp1
  menu label ^Install Kylin Linux Advanced Server V10 SP1
  kernel images/v10sp1/vmlinuz
  append initrd=images/v10sp1/initrd.img inst.ks=http://10.0.0.1/kickstart/v10sp1.cfg quiet

label v10sp2
  menu label ^Install Kylin Linux Advanced Server V10 SP2
  kernel images/v10sp2/vmlinuz
  append initrd=images/v10sp2/initrd.img inst.ks=http://10.0.0.1/kickstart/v10sp2.cfg quiet

# 创建 UEFI 目录
mkdir -p /srv/tftp/efi/x86_64

# 准备 BOOTX64.EFI、grubx64.efi 和 grub.cfg 文件
cp /var/www/html/rhel79/x86_64/base/EFI/BOOT/BOOTX64.EFI /srv/tftp/efi/x86_64/
cp /var/www/html/rhel79/x86_64/base/EFI/BOOT/grubx64.efi /srv/tftp/efi/x86_64/
cp /var/www/html/rhel79/x86_64/base/EFI/BOOT/grub.cfg /srv/tftp/efi/x86_64/

# 准备 vmlinuz 和 initrd.img 文件
mkdir -p /srv/tftp/efi/x86_64/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/vmlinuz /srv/tftp/efi/x86_64/images/rhel79/
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/initrd.img /srv/tftp/efi/x86_64/images/rhel79/

# 准备 grub.cfg 文件
$ sudo vim /srv/tftp/efi/x86_64/grub.cfg
set timeout=5
set default=0

menuentry 'Install Red Hat Enterprise Linux 7.9' {
  linuxefi efi/x86_64/images/rhel79/vmlinuz ip=dhcp inst.ks=http://10.0.0.1/kickstart/rhel79.cfg
  initrdefi efi/x86_64/images/rhel79/initrd.img
}

menuentry 'Install Kylin Linux Advanced Server V10 SP1' {
  linuxefi efi/x86_64/images/v10sp1/vmlinuz ip=dhcp inst.ks=http://10.0.0.1/kickstart/v10sp1.cfg
  initrdefi efi/x86_64/images/v10sp1/initrd.img
}

menuentry 'Install Kylin Linux Advanced Server V10 SP2' {
  linuxefi efi/x86_64/images/v10sp2/vmlinuz ip=dhcp inst.ks=http://10.0.0.1/kickstart/v10sp2.cfg
  initrdefi efi/x86_64/images/v10sp2/initrd.img
  
# 最终目录结构如下
/srv/tftp
├── bios
│   └── x86_64
│       ├── images
│       │   ├── rhel79
│       │   │   ├── initrd.img
│       │   │   └── vmlinuz
│       │   ├── v10sp1
│       │   │   ├── initrd.img
│       │   │   └── vmlinuz
│       │   └── v10sp2
│       │       ├── initrd.img
│       │       └── vmlinuz
│       ├── pxelinux.0
│       ├── pxelinux.cfg
│       │   └── default
│       └── vesamenu.c32
└── efi
    └── x86_64
        ├── BOOTX64.EFI
        ├── grub.cfg
        ├── grubx64.efi
        └── images
            ├── rhel79
            │   ├── initrd.img
            │   └── vmlinuz
            ├── v10sp1
            │   ├── initrd.img
            │   └── vmlinuz
            └── v10sp2
                ├── initrd.img
                └── vmlinuz
```

## 查看日志

```sh
tail -f /var/log/syslog | grep dhcp
tail -f /var/log/syslog | grep tftp
tail -f /var/log/nginx/access.log
```

## 调试

```sh
# 测试镜像源
curl 10.0.0.1
curl 10.0.0.1/kickstart/rhel79.cfg

# 测试 DHCP
sudo nmap --script broadcast-dhcp-discover
sudo nmap --script broadcast-dhcp-discover -e eth0
dhcp-lease-list

# 测试 TFTP
$ tftp 10.0.0.1
tftp> get bios/x86_64/pxelinux.0
Received 27158 bytes in 0.1 seconds
tftp>
```
