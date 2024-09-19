# Docker

## 迁移数据目录

如果存放 Docker 镜像的磁盘空间不够了，你可能需要将它移动到其他磁盘上

```sh
# 停止服务
sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl stop containerd

# 移动数据目录
sudo mv /var/lib/docker /opt

# 修改数据目录位置
sudo vim /etc/docker/daemon.json
{
  "data-root": "/opt/docker"
}

# 启动 Docker
sudo systemctl start docker

# 检查 Docker 数据目录是否已更新
sudo docker info -f '{{ .DockerRootDir}}'
```

- [Relocating the Docker root directory](https://www.ibm.com/docs/en/z-logdata-analytics/5.1.0?topic=software-relocating-docker-root-directory)


