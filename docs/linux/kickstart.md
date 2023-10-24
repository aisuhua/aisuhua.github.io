# PXE 自动装机

## 通过 ISO 搭建软件源

```sh
# 挂载 ISO 到本地目录
mount rhel-server-7.9-x86_64-dvd.iso /opt/mirror/rhel79

# 配置 Nginx 能访问镜像源
root /opt/mirror/rhel79;
autoindex on
```

## 准备 Kickstart
