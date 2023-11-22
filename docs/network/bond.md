# bond

## 清空网卡配置



## 单网卡配置

```sh
sudo nmcli connection add con-name eth0 ifname ens192 type Ethernet ip4 10.0.0.100/24 gw4 10.0.0.254 ipv4.dns 223.5.5.5 ipv4.method manual connection.autoconnect yes
sudo nmcli connection up eth0
```

## 双网卡 bond

```sh
sudo nmcli connection add con-name bond0 ifname bond0 type bond mode active-backup ip4 10.0.0.100/24 gw4 22.145.30.254 ipv4.dns 22.145.30.160 ipv4.method manual connection.autoconnect yes
sudo nmcli connection add type bond-slave ifname eth0 master bond0
sudo nmcli connection add type bond-slave ifname eth1 master bond0
```

