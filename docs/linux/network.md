# 网络

## CheetSheet

配置 DNS

```sh
# 配置 DNS 服务器
sudo nmcli con mod ens33 ipv4.dns "223.5.5.5 223.6.6.6"

# 等同于编辑 /etc/sysconfig/network-scripts/ifcfg-ens33 
DNS1=223.5.5.5
DNS2=223.6.6.6

# Ignore automatically configured nameservers and search domains
nmcli con mod ens33 ipv4.ignore-auto-dns yes

## 等同于编辑 /etc/sysconfig/network-scripts/ifcfg-ens33 
PEERDNS=no

# 重启 NetworkManager
sudo systemctl restart NetworkManager
```

查看默认网关

```sh
$ ip route | grep default
default via 192.168.88.1 dev enp60s0 proto static metric 100
```

## Links

- [How to manage DNS in NetworkManager via console (nmcli)?](https://serverfault.com/a/810639)
- [Linux: Create virtual network interface](https://linuxconfig.org/configuring-virtual-network-interfaces-in-linux)
- [How to configure network interface bonding on RHEL 8 / CentOS 8 Linux](https://linuxconfig.org/how-to-configure-network-interface-bonding-on-red-hat-enterprise-linux-8)
- [虚拟机下面实现双网卡绑定<bond0>](https://blog.csdn.net/robertkun/article/details/16873961)
