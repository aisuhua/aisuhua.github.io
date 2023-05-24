# 客户端配置

## Kylin V10

修改 DNS 配置

```ini
# /etc/systemd/resolved.conf

[Resolve]
DNS=192.168.1.100
...
```

重启服务生效

```sh
sudo systemctl daemon-reload
sudo systemctl restart systemd-resolved
```
