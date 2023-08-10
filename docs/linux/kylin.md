# Kylin

## 配置网络

```sh
# 配置 IP
[root@test ~]# cat /etc/sysconfig/network-scripts/ifcfg-ens33
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
#BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable-privacy
NAME=ens33
UUID=c67c9f61-64d2-44ad-999a-80b9f260a775
DEVICE=ens33
#ONBOOT=no

ONBOOT=yes
BOOTPROTO=static
IPADDR=172.16.230.199
NETMASK=255.255.255.0
GATEWAY=172.16.230.2
DNS1=223.5.5.5
DNS2=114.114.114.114

# 重启网卡
ifdown ens33
ifup ens33

# nmcli 重新加载网卡配置文件
nmcli connection load /etc/sysconfig/network-scripts/ifcfg-ens33
nmcli connection up ens33

# 或者重新加载所有网卡配置文件
nmcli connection reload
nmcli connection up ens33
```

## 修改字符集

```sh
# 查看当前字符集
locale

# 使用 localectl 命令修改
sudo localectl set-locale LANG=en_US.UTF-8

# 或者直接修改配置文件
[root@test ~]# vim /etc/locale.conf
LANG=en_US.UTF-8
```

