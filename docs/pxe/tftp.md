# TFTP

## 安装

```sh
sudo apt install tftpd-hpa
```

## 配置

记录传输日志，`TFTP_OPTIONS` 参数加上 `-vvv`

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
cp /var/www/html/rhel79/x86_64/base/isolinux/isolinux.cfg /srv/tftp/pxelinux/pxelinux.cfg/default
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

同时支持 BIOS 和 UEFI 两种启动方式所需的文件

```sh
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
vim /srv/tftp/bios/x86_64/pxelinux.cfg/default

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
  
# BIOS 最终目录结构如下
/srv/tftp/bios
└── x86_64
    ├── images
    │   ├── rhel79
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

# 创建 UEFI 目录
mkdir -p efi/x86_64

# 准备 BOOTX64.EFI、grubx64.efi 和 grub.cfg 文件
cp /var/www/html/rhel79/x86_64/base/EFI/BOOT/BOOTX64.EFI /srv/tftp/efi/x86_64/
cp /var/www/html/rhel79/x86_64/base/EFI/BOOT/grubx64.efi /srv/tftp/efi/x86_64/
cp /var/www/html/rhel79/x86_64/base/EFI/BOOT/grub.cfg /srv/tftp/efi/x86_64/
chmod 644 /srv/tftp/efi/x86_64/BOOTX64.EFI
chmod 644 /srv/tftp/efi/x86_64/grubx64.efi

# 准备 vmlinuz 和 initrd.img 文件
mkdir -p /srv/tftp/efi/x86_64/images/rhel79
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/vmlinuz /srv/tftp/efi/x86_64/images/rhel79/
cp /var/www/html/rhel79/x86_64/base/images/pxeboot/initrd.img /srv/tftp/efi/x86_64/images/rhel79/

# 准备 grub.cfg 文件
vim /srv/tftp/efi/x86_64/grub.cfg

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
sudo tail -f /var/log/syslog | grep tftp
```
