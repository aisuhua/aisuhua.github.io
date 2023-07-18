# Mirror

## Ubuntu

```sh
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
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
