# bond

## 单网卡配置

```sh
sudo nmcli connection add con-name eth0 ifname ens192 type Ethernet ip4 10.0.0.100/24 gw4 10.0.0.254 ipv4.dns 223.5.5.5 ipv4.method manual connection.autoconnect yes
sudo nmcli connection up eth0
```

## 双网卡 bond

```sh
sudo nmcli connection add type bond con-name bond0 ifname bond0 mode active-backup ip4 10.0.0.100/24 gw4 10.0.0.254 ipv4.dns 223.5.5.5 ipv4.method manual connection.autoconnect yes
nmcli connection add type ethernet slave-type bond con-name bond0-eth0 ifname eth0 master bond0
nmcli connection add type ethernet slave-type bond con-name bond0-eth1 ifname eth1 master bond0
```

## 参考文献

- [Chapter 3. Configuring network bonding](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/configuring-network-bonding_configuring-and-managing-networking)
