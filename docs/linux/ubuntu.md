# Ubuntu

## 桌面快捷方式

```sh
vim ~/.local/share/applications/idea.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Idea
Icon=/data/soft/idea-IU-241.18034.62/bin/idea.svg
Exec=/data/soft/idea-IU-241.18034.62/bin/idea.sh
```

- https://askubuntu.com/a/1329039/1792429

## 离线安装软件

```sh
apt install aptitude
sudo aptitude --download-only install <package-name>
# 或者
apt-get -d install <package-name>

# deb 包会下载到 /var/cache/apt/archives 目录
# 将它拷贝到离线环境的服务器后执行
dpkg -i *.deb

# 如需查看已下载文件的情况
apt-get -d install libgcc1
apt-cache show libgcc1 | grep Filename

# sample output:
# Filename: pool/main/g/gcc-4.9/libgcc1_4.9.2-10_amd64.deb

#!/bin/bash

set -xe

packages=(ansible ieee-data python3-jinja2 python3-markupsafe python3-netaddr)

# 目标目录
DOWNLOAD_DIR="pkgs"

# 创建目录（如果不存在）
mkdir -p "$DOWNLOAD_DIR"

for pkg in "${packages[@]}"; do
  #echo "Checking package: $pkg"
  url=`apt-cache show "$pkg" | grep Filename | head -1 | sed 's/amd64/arm64/' | awk -F ': ' '{print "http://archive.kylinos.cn/kylin/KYLIN-ALL/" $2}'`
  echo $url
  echo "Downloading: $url"
  wget -c -P "$DOWNLOAD_DIR" "$url"
done

echo "All downloads completed."
```

- [Ubuntu中使用apt下载离线包以及相关依赖包](https://www.cnblogs.com/guangdelw/p/17412992.html)
- [Given a debian package name, how do I get a URL to the latest .deb URL?](https://unix.stackexchange.com/questions/332739/given-a-debian-package-name-how-do-i-get-a-url-to-the-latest-deb-url)

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
