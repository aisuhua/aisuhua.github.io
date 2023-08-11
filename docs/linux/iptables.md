# iptables

```sh
# 在表头插入规则
iptables -t filter -I INPUT -s 172.16.230.101 -j ACCEPT

# 或者忽略 -t filter 默认就是编辑 filter 表
iptables -I INPUT -s 172.16.230.101 -j ACCEPT

# 在表尾追加规则
iptables -A INPUT -s 172.16.230.101 -j ACCEPT

# 将规则插入特定位置
iptables -I INPUT 2 -s 172.16.230.101 -j ACCEPT

# 清空所有规则
iptables -F 
```
