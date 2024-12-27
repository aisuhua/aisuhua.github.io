# Ubuntu

## 离线安装软件

```sh
apt install aptitude
sudo aptitude --download-only install <package-name>
# 或者
apt-get -d install <package-name>

# deb 包会下载到 /var/cache/apt/archives 目录
# 将它拷贝到离线环境的服务器后执行
dpkg -i *.deb
```

- [Ubuntu中使用apt下载离线包以及相关依赖包](https://www.cnblogs.com/guangdelw/p/17412992.html)

## 其他

```sh
# sources.list 只使用 x84_64 源
deb [arch=amd64] http://pathtoserver/ubuntu bionic main
```

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


sudo service network-manager restart
```

## Links

- [How to control IP ranges of Network Manager's hotspots?](https://askubuntu.com/questions/844913/how-to-control-ip-ranges-of-network-managers-hotspots)
- [How to have both arch=amd64 and trusted=yes in sources.list of apt package manager?](https://askubuntu.com/questions/1212851/how-to-have-both-arch-amd64-and-trusted-yes-in-sources-list-of-apt-package-manag)
