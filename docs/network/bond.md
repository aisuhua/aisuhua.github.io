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

## 切换测试

```sh
ifdown eth0
ifup eth0
cat /proc/net/bonding/bond0
nmcli con reload
systemctl restart network
```

## 参考文献

- [Chapter 3. Configuring network bonding](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/configuring-network-bonding_configuring-and-managing-networking)
- [7.3. Network Bonding Using the NetworkManager Command Line Tool, nmcli](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-network_bonding_using_the_networkmanager_command_line_tool_nmcli)
- [Interface bonding CENTOS 6/7](https://core.at/interface-bonding-centos-6-7/)
