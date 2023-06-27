# 安装

## 国内源

```sh
cat << EOF | sudo tee /etc/docker/daemon.json
{
  "registry-mirrors":[
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com",
    "https://qby02i3s.mirror.aliyuncs.com",
    "https://docker.mirrors.ustc.edu.cn"
  ],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
```

## 授权普通用户

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
```

## 添加非安全镜像仓库

`vim /etc/docker/daemon.json`

```json
{
  "insecure-registries" : [
    "http://registry.example.com:5000"
  ]
}
```
