# CoreDNS

同类的 DNS 还有 dnsmasq、bind 等。之所以选择 CoreDNS 是因为它非常轻便和易用，同时也是为了熟悉 Kubenetes 的运作。

## 安装

使用官方的 docker 镜像进行安装，可以参考 https://github.com/aisuhua/docker-coredns

```sh
git clone git@github.com:aisuhua/docker-coredns.git
cd docker-coredns
docker-compose up
```

## 使用

### Kylin V10

修改 DNS 配置

```sh
sudo vim /etc/systemd/resolved.conf
```

将域名服务器 IP 加到配置文件

```
[Resolve]
DNS=192.168.1.100
...
```

重启服务生效

```sh
sudo systemctl daemon-reload
sudo systemctl restart systemd-resolved
```
