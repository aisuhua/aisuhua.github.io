# 操作系统初始化

## 修改主机名

```sh
# rhel5/6
# 马上生效（重启后无效）
hostname server
# /etc/sysconfig/network
HOSTNAME=server
# /etc/hosts
127.0.0.1 server

# rhel7/8、Kylin V7/V10
hostnamectl set-hostname server
# /etc/hosts
127.0.0.1 server
```

## 镜像源

```sh
# 内容详见 repo/

# Kylin V10
/etc/yum.repos.d/kylin_x86_64.repo

# Kylin V7update6
/etc/yum.repos.d/kns7-adv.repo

# RedHat
/etc/yum.repos.d/redhat.repo
```

## 安装软件

```sh
yum -y install telnet
yum -y install net-tools
yum -y install nc
yum -y install unzip
yum -y install ftp
yum -y install bc
yum -y install lrzsz
yum -y install chrony
yum -y install traceroute
yum -y install tar
```



## Ref

- [CentOS Linux 5/6 Change Hostname Command](https://www.cyberciti.biz/faq/centos-hostname-change-command-line/)
- [RHEL / Centos Linux 7: Change and Set Hostname Command](https://www.cyberciti.biz/faq/rhel-redhat-centos-7-change-hostname-command/)
