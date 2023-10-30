# 简单的示例

## 安装所需的软件

```sh
sudo apt install isc-dhcp-server tftpd-hpa nginx
```

## 准备操作系统 ISO

```sh
rhel-server-7.9-x86_64-dvd.iso
rhel-8.3-x86_64-dvd.iso
Kylin-Server-10-SP1-Release-Build20-20210518-x86_64.iso
Kylin-Server-10-SP2-x86-Release-Build09-20210524.iso
```

## Kickstart

可以手工安装好操作系统后，从 `/root/anaconda-ks.cfg` 得到，然后按需进行自定义即可。

## 制作镜像源

```sh
# 创建 iso 临时挂在目录
mkdir -p /mnt/{rhel79,rhel83,v10sp1,v10sp2}

# 将镜像挂载到目录
mount rhel-server-7.9-x86_64-dvd.iso /mnt/rhel79
mount rhel-8.3-x86_64-dvd.iso /mnt/rhel83
mount Kylin-Server-10-SP1-Release-Build20-20210518-x86_64.iso /mnt/v10sp1
mount Kylin-Server-10-SP2-x86-Release-Build09-20210524.iso /mnt/v10sp2

# 创建镜像文件存放目录
mkdir -p /opt/www/mirror

# 拷贝文件到镜像文件目录
cp -r /mnt/rhel79 /opt/www/mirror/rhel79
cp -r /mnt/rhel83 /opt/www/mirror/rhel83
cp -r /mnt/v10sp1 /opt/www/mirror/v10sp1
cp -r /mnt/v10sp2 /opt/www/mirror/v10sp2
```

## 将 kickstart 文件放到 web 目录

```sh
# 创建存放 kickstart 文件的目录
mkdir -p /opt/www/mirror/ks

# 按需创建 ks 文件
touch /opt/www/mirror/ks/ks.cfg
```

## 配置 Nginx

```nginx
# /etc/nginx/site-enabled/default
server {
  listen 80;
  root /opt/www/mirror;
  autoindex on;
}

# 验证
curl localhost/ks/ks.cfg
```

## 配置 DHCP

```sh
# /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;
log-facility local7;

subnet 10.0.0.0 netmask 255.255.255.0 {
  range 10.0.0.10 10.0.0.50;
  next-server 10.0.0.1;
  filename "pxelinux/pxelinux.0";
}

# 配置成记录日志
# /etc/rsyslog.d/dhcp-relay.conf
local7.* -/var/log/dhcp-relay.log

# 验证是否可获取到 IP
sudo nmap --script broadcast-dhcp-discover

# 查看已分配的 IP
dhcp-lease-list

# 绑定特定网卡 选做
# /etc/default/isc-dhcp-server
INTERFACESv4="wlp0s20f3"
INTERFACESv4="wlp0s20f3"

# 查看日志
tail -f /var/log/syslog | grep dhcp
```

## 配置 TFTP

```sh
# 配置成记录访问日志 -vvv
# /etc/default/tftpd-hpa
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/var/lib/tftpboot"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure -vvv"

# 创建 pxe 文件目录
mkdir -p /var/lib/tftpboot/pxelinux/images/{rhel79,rhel83,v10sp1,v10sp2}
mkdir -p /var/lib/tftpboot/pxelinux/pxelinux.cfg

# 拷贝所需文件
/opt/www/mirror/rhel79/Packages/syslinux-4.05-15.el7.x86_64.rpm
rpm2cpio syslinux-4.05-15.el7.x86_64.rpm | cpio -dimv
cp usr/share/syslinux/pxelinux.0 /var/lib/tftpboot/pxelinux/
cp usr/share/syslinux/vesamenu.c32 /var/lib/tftpboot/pxelinux/

# 拷贝内核和临时文件系统
cp /opt/www/mirror/rhel79/images/pxeboot/vmlinuz /var/lib/tftpboot/pxelinux/images/rhel79/
cp /opt/www/mirror/rhel79/images/pxeboot/initrd.img /var/lib/tftpboot/pxelinux/images/rhel79/

# 创建 default 文件
# /var/lib/tftpboot/pxelinux/pxelinux.cfg/default
default vesamenu.c32
timeout 600
menu clear

label local
  menu label Boot from ^local drive
  menu default
  localboot 0xffff

label rhel79
  menu label ^Install Red Hat Enterprise Linux 7.9
  kernel images/rhel79/vmlinuz
  append initrd=images/rhel79/initrd.img ip=dhcp inst.ks=http://10.0.0.1/ks/rhel79.cfg quiet

label rhel83
  menu label ^Install Red Hat Enterprise Linux 8.3
  kernel images/rhel83/vmlinuz
  append initrd=images/rhel83/initrd.img ip=dhcp inst.ks=http://10.0.0.1/ks/rhel83.cfg quiet

label v10sp1
  menu label ^Install Kylin Linux Advanced Server V10 SP1
  kernel images/v10sp1/vmlinuz
  append initrd=images/v10sp1/initrd.img ip=dhcp inst.ks=http://10.0.0.1/ks/v10sp1.cfg quiet

label v10sp2
  menu label ^Install Kylin Linux Advanced Server V10 SP2
  kernel images/v10sp2/vmlinuz
  append initrd=images/v10sp2/initrd.img ip=dhcp inst.ks=http://10.0.0.1/ks/v10sp2.cfg quiet
```





