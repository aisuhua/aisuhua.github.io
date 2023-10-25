# Ubuntu

## 修改 HotSpot 密码

```sh
sudo nm-connection-editor
```

## apt 使用代理

```sh
sudo apt -o acquire::http::proxy="http://127.0.0.1:1080" install fluent-bit
```

## 修改网段和IP

```sh
sudo vim /etc/NetworkManager/system-connections/Hotspot
[ipv4]
dns-search=
method=shared
address1=10.0.0.1/24,10.0.0.1
```
