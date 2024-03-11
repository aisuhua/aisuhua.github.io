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

## 防火墙

```sh
# Flush the selected chain (all the chains in the table if none is given). This is equivalent to deleting all the rules one by one.
iptables -F

# Delete the optional user-defined chain specified.
iptables -X

# 入流量默认禁止
iptables -P INPUT DROP

# 出去流量默认允许
iptables -P OUTPUT ACCEPT

# 允许本机访问
iptables -A INPUT -s 127.0.0.1 -j ACCEPT
# 或者
iptables -A INPUT -i lo -j ACCEPT
# 接受 ping
iptables -A INPUT -p icmp -j ACCEPT
# ??
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# 放开常用端口
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# 整段放开
iptables -A INPUT -s 21.144.204.0/24 -j ACCEPT
# 或者整段放开，除了 22 端口不能访问外
iptables -A INPUT -p tcp -s 21.144.204.0/24 ! --dport 22 -j ACCEPT
# 允许访问特定协议特定端口
iptables -A INPUT -s 21.144.204.2/32 -p tcp --dport 10001 -j ACCEPT

# 持久化保存 iptables 规则
iptables-save > /etc/sysconfig/iptables
```



## Ref

- [CentOS Linux 5/6 Change Hostname Command](https://www.cyberciti.biz/faq/centos-hostname-change-command-line/)
- [RHEL / Centos Linux 7: Change and Set Hostname Command](https://www.cyberciti.biz/faq/rhel-redhat-centos-7-change-hostname-command/)
