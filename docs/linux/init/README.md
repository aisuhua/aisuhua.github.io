# 操作系统初始化

## 修改主机名

```
# rhel5/6
# /etc/sysconfig/network
HOSTNAME=server
# /etc/hosts
127.0.0.1 server
# 临时生效（重启后无效）
hostname server

# rhel7/8
hostnamectl set-hostname server
# /etc/hosts
127.0.0.1 server


```

## Ref

- [CentOS Linux 5/6 Change Hostname Command](https://www.cyberciti.biz/faq/centos-hostname-change-command-line/)