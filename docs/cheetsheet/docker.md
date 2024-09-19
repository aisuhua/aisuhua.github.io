# Docker

## 迁移数据目录

```sh
# 停止服务
sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl stop containerd

# 创建新的数据目录
sudo mkdir -p /opt/
```
