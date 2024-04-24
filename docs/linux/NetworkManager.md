# NetworkManager

##  /etc/resolv.conf

```
# 取消通过 NetworkManager 管理 /etc/resolv.conf 文件
# vim /etc/NetworkManager/conf.d/90-dns-none.conf
[main]
dns=none

# 重载配置生效
systemctl reload NetworkManager

# 直接修改 /etc/resolv.conf 即可
vim /etc/resolv.conf

# 验证
# vim /etc/resolv.conf 修改后
# systemctl reload NetworkManager
# 查看 /etc/resolv.conf 是不是没有变化

# 查看 NetworkManager 现有配置
NetworkManager --print-config
```

## link 

- [Chapter 20. Manually configuring the /etc/resolv.conf file](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/manually-configuring-the-etc-resolv-conf-file_configuring-and-managing-networking)
