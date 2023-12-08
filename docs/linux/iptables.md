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

# RHEL7、8，v7update6 需单独安装，RHEL5、6、kylin v10 默认自带
sudo yum install iptables-services

# 保存配置，配置保存位置 /etc/sysconfig/iptables
# RHEL 5/6/
/etc/init.d/iptables save

# RHEL7、8/kylin v10/v7update6/
service iptables save

service iptables restart 
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

## 注意事项

```sh
# Yes, once you have added a rule to iptables it becomes active immediately - this is why you should be careful with your rules as it is possible to lock yourself out.

# The iptables-save command writes a series of iptables commands to a file such that the current state of the firewall can be saved. If you want to restore that state you can use the iptables-restore command.
```

## Links

- [iptables 系列文章](https://www.zsythink.net/archives/tag/iptables/)
- [Is it enough adding iptables rules without restart?](https://serverfault.com/questions/246829/is-it-enough-adding-iptables-rules-without-restart)
- [Is "iptables-save" will reload iptable configuration?](https://serverfault.com/questions/828330/is-iptables-save-will-reload-iptable-configuration)
- [3 ways to make iptables persistent](https://medium.com/@oryaacov/3-ways-to-make-iptables-persistent-a77e956ee78)
