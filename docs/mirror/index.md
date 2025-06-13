# Mirror

- https://developer.aliyun.com/mirror/
- https://mirrors.aliyun.com/centos-vault/7.0.1406/isos/x86_64/
- https://mirrors.huaweicloud.com/home
- https://mirrors.163.com/
- https://mirrors.ustc.edu.cn/

## CentOS

```sh
# 备份
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

# CentOS 7
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo

# EPEL
wget -O /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-7.repo
curl -o /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-7.repo

# CentOS 8
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo

# CentOS 6
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo

# EPEL
wget -O /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-6.repo
curl -o /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-6.repo

# 刷新源缓存
yum clean all && yum makecache
```

## Debian

```sh
sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list

# or
sudo sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo sed -i 's/http:/https:/g' /etc/apt/sources.list
```

## Ubuntu

```sh
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

# PPA
sed -i "s/http:\/\/ppa.launchpad.net/https:\/\/launchpad.proxy.ustclug.org/g" /etc/apt/sources.list.d/*.list

# 或者
find /etc/apt/sources.list.d/ -type f -name "*.list" -exec  sed  -i.bak -r  's#deb(-src)?\s*http(s)?://ppa.launchpad.net#deb\1 https\2://launchpad.proxy.ustclug.org#ig' {} \;
```

## Alpine

```sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
```

## Node.js

```sh
npm config set registry https://registry.npmmirror.com
```

## Composer

```sh
# 全局
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 当前项目
composer config repo.packagist composer https://mirrors.aliyun.com/composer/
```

## Python

```sh
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
```

## Go

```sh
export GOPROXY=https://proxy.golang.com.cn,direct
```

## Time

```sh
ntp.aliyun.com
```
