# 安装

## 安装 Docker

```sh
sudo apt-get update

sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=$(dpkg --print-architecture)] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl start docker
sudo systemctl enable docker
```

- [安装Docker](https://help.aliyun.com/zh/ecs/use-cases/install-and-use-docker-on-a-linux-ecs-instance#8dca4cfa3dn0e)

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

# activate the changes to groups
newgrp docker
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

## Links

- [Linux post-installation steps for Docker Engine](https://docs.docker.com/engine/install/linux-postinstall/)
