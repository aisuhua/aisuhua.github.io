# iptables

## 安装

```sh
systemctl stop firewalld 
systemctl disable firewalld 

yum -y install iptables-services 
systemctl enable iptables
systemctl start iptables

vim /etc/sysconfig/iptables
sudo systemctl restart iptables

$ sudo service iptables save
iptables: Saving firewall rules to /etc/sysconfig/iptables: [  OK  ]
```

## 使用

```sh
# 查看规则，相当于 iptables -t filter -L
iptables -L

# 只看 INPUT 链的 filter 表
iptables -nvL INPUT --line-numbers

# 在表头插入规则 -I insert
iptables -t filter -I INPUT -s 172.16.230.101 -j ACCEPT

# 或者忽略 -t filter 默认就是编辑 filter 表
iptables -I INPUT -s 172.16.230.101 -j ACCEPT

# 在表尾追加规则 -A append
iptables -A INPUT -s 172.16.230.101 -j ACCEPT

# 将规则插入特定位置
iptables -I INPUT 2 -s 172.16.230.101 -j ACCEPT

# 清空所有链表的规则
iptables -F 

# 仅仅清空 filter 表的规则
iptables -t filter -F

# 仅仅清空 INPUT 链 filter 表的规则
iptables -t filter -F INPUT
```

## Links

- [iptables 系列文章](https://www.zsythink.net/archives/tag/iptables/)
