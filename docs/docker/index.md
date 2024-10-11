# Docker

## Container

```sh
# 删除所有已停止的容器
docker container prune -f

# 删除所有容器，除了 php 和 nginx
docker rm $(docker ps -a | grep -Ewv "php|nginx" | awk 'NR>1 {print $1}')

# 删除所有容器
docker rm -vf $(docker ps -aq)

# 交互式使用
ocker run -u "$(id -u):$(id -g)" -v $PWD:/app --tty --interactive --workdir /app ghcr.io/getzola/zola:v0.16.0 init
```

## Volume

```sh
# 删除所有没在使用的卷
docker volume prune
```

## Image

```sh
# 从小到大排序镜像
docker images --format "{{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}" | sort -k 2 -h

# 清理 none 镜像
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

# 删除所有镜像，除了 php 和 alpine
docker rmi $(docker images -a | grep -Ewv 'php|alpine' | awk {'print $1'})

# 清空所有镜像
docker rmi -f $(docker images -aq)

# 导出镜像
docker save nginx:latest | gzip > nginx.gz

# 导入镜像
docker load -i nginx.gz
```

## Build

```sh
# Ubuntu 非交互方式安装软件
ARG DEBIAN_FRONTEND=noninteractive
```

## SSL

```sh
# 单独给仓库配置根证书
cp ca.crt /etc/docker/certs.d/yourdomain.com:port/
```

## Backup

```sh
# 安装
sudo curl -sSL https://raw.githubusercontent.com/BretFisher/docker-vackup/main/vackup > /usr/local/bin/vackup
sudo chmod +x /usr/local/bin/vackup

# 备份和恢复 volume
vackup export VOLUME_NAME VOLUME_NAME.tar.gz
vackup import VOLUME_NAME.tar.gz VOLUME_NAME
```

## 迁移数据目录

```sh
sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl stop containerd

sudo mkdir -p /new_dir_structure
sudo mv /var/lib/docker /new_dir_structure
sudo vim /etc/docker/daemon.json
{
  "data-root": "/new_dir_structure/docker"
}
sudo systemctl start docker
docker info -f '{{ .DockerRootDir}}'
```

## 参考文献

- [Back Up and Share Docker Volumes with This Extension](https://www.docker.com/blog/back-up-and-share-docker-volumes-with-this-extension/)
- https://github.com/BretFisher/docker-vackup
- [Relocating the Docker root directory](https://www.ibm.com/docs/en/z-logdata-analytics/5.1.0?topic=software-relocating-docker-root-directory)
