# Docker

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

# 导出镜像
docker save nginx:latest | gzip > nginx.gz

# 导入镜像
docker load -i nginx.gz
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

## 参考文献

- [Back Up and Share Docker Volumes with This Extension](https://www.docker.com/blog/back-up-and-share-docker-volumes-with-this-extension/)
- https://github.com/BretFisher/docker-vackup
