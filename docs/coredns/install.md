# 安装

可以[使用 Docker 或者二进制方式安装](https://coredns.io/manual/toc/#installation)，个人偏向于使用 Docker，并在官方镜像基础上做了封装，详见 [aisuhua/docker-coredns](https://github.com/aisuhua/docker-coredns)。

## 安装

```sh
git clone git@github.com:aisuhua/docker-coredns.git
cd docker-coredns
docker-compose up
```

## 验证

```sh
dig @127.0.0.1 master1.ocp1.example.com
dig @127.0.0.1 -x 192.168.1.20
```
