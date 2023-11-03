# DHCP

## 安装

```sh
sudo apt install isc-dhcp-server
```

## 配置

只支持 BIOS 启动的配置示例

```sh
# /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;

subnet 10.0.0.0 netmask 255.255.255.0 {
  range 10.0.0.10 10.0.0.50;
  next-server 10.0.0.1;
  filename "pxelinux/pxelinux.0";
}
```

支持 BIOS 和 UEFI 两种启动方式的配置示例

```sh
# /etc/dhcp/dhcpd.conf
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
```

## 验证

测试是否可获取到动态 IP

```sh
sudo nmap --script broadcast-dhcp-discover

# 指定特定网卡
sudo nmap --script broadcast-dhcp-discover -e eth0
```

查看已分配的 IP

```sh
dhcp-lease-list
```

## 查看日志

开启日志记录功能

```sh
# /etc/dhcp/dhcpd.conf
log-facility local7;
```

配置 rsyslog 收集日志

```sh
# /etc/rsyslog.d/dhcp-relay.conf
local7.* -/var/log/dhcp-relay.log
```

查看日志

```sh
tail -f /var/log/syslog | grep dhcp
```

## 高级配置

只监听指定网卡

```sh
# /etc/default/isc-dhcp-server
INTERFACESv4="eth0"
```

## 参考

- [dhcp-relay custom log file](https://unix.stackexchange.com/questions/615461/dhcp-relay-custom-log-file)
