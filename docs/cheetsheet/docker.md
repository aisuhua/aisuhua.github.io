# Docker

## Install

```sh
# 普通用户使用 docker
sudo groupadd docker
sudo usermod -aG docker $USER
```

## Container

```sh
# 删除所有容器，除了 php 和 nginx
docker rm $(docker ps -a | grep -Ewv "php|nginx" | awk 'NR>1 {print $1}')
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
```

