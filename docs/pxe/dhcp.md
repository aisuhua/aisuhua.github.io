# DHCP

## 安装

```sh
sudo apt install isc-dhcp-server
```

## 配置

只支持 BIOS 启动的配置示例

```
# /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;
log-facility local7;

subnet 10.0.0.0 netmask 255.255.255.0 {
  range 10.0.0.10 10.0.0.50;
  next-server 10.0.0.1;
  filename "pxelinux/pxelinux.0";
}
```

记录日志

```sh
# /etc/rsyslog.d/dhcp-relay.conf
local7.* -/var/log/dhcp-relay.log
```

DHCP 绑定特定的网卡

```sh
# /etc/default/isc-dhcp-server
INTERFACESv4="eth0"
```

## 验证

测试是否可获取到动态 IP

```sh
sudo nmap --script broadcast-dhcp-discover
```

查看已分配的 IP

```sh
dhcp-lease-list
```

查看日志

```sh
tail -f /var/log/syslog | grep dhcp
```
