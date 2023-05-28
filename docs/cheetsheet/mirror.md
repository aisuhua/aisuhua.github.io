# Mirror

## Ubuntu

```sh
sudo sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sudo sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
```

## Alpine

```sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
```

## Node.js

```sh
npm config set registry https://registry.npmmirror.com
```

## Python

```sh
pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
```

## Go

```sh
export GOPROXY=https://proxy.golang.com.cn,direct
```
