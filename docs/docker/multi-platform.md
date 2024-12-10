# multi-platform

从 yum 源安装 docker 和 buildx

```sh
sudo yum -y update
sudo wget -O /etc/yum.repos.d/docker-ce.repo https://mirrors.aliyun.com/docker-ce/linux/rhel/docker-ce.repo
sudo yum -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

从二进制安装

```sh
# install docker engine
wget https://download.docker.com/linux/static/stable/x86_64/docker-24.0.9.tgz
tar -zcvf docker-24.0.9.tgz
cp docker-24.0.9/* /usr/local/bin/

# install docker buildx
wget https://github.com/docker/buildx/releases/download/v0.19.2/buildx-v0.19.2.linux-amd64
mkdir -p ~/.docker/cli-plugins
cp buildx-v0.19.2.linux-amd64 ~/.docker/cli-plugins/docker-buildx
chmod a+x ~/.docker/cli-plugins/docker-buildx
```

修改 containerd image store

```sh
vim /etc/docker/daemon.json
{
  "features": {
    "containerd-snapshotter": true
  }
}

systemctl restart docker
```

安装 QEMU

```sh
docker run --privileged --rm tonistiigi/binfmt --install all
```

检查支持编译成的架构

```sh
docker buildx ls
```

编写多平台镜像

```sh
# Dockerfile
FROM hub.geekery.cn/ubuntu:24.04
RUN uname -m > /arch

docker build -t test:v1 --platform linux/arm64 --load .
docker build -t 10.0.0.1:5000/test:v1 --platform linux/arm64,linux/amd64 --push .
```

以指定 CPU 架构运行镜像

```sh
docker run --rm --platform linux/amd64 test:v1 cat /arch
docker run --rm --platform linux/arm64 test:v1 cat /arch
```

查看镜像的 manifest 信息

```sh
docker inspect test:v1

```
