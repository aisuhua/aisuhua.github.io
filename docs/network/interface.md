# Interface

## 为网卡添加一个 IP

```sh
# 添加 IP
sudo ip address add <ip-address>/<prefix-length> dev <interface>

# 删除 IP
sudo ip address del 172.16.100.17/24 dev eth0

# 查看 IP
ip address show eth0
```

## 参考

- [How can I (from CLI) assign multiple IP addresses to one interface?](https://askubuntu.com/questions/547289/how-can-i-from-cli-assign-multiple-ip-addresses-to-one-interface)
