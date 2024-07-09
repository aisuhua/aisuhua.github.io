# SSH

## 使用

```sh
# Disable strict host key checking
ssh -o StrictHostKeyChecking=no user@remote-host 

# 查看帮助信息
man sshd_config 

# 查看所支持的所有加密算法
ssh -Q cipher

# 测试配置
/usr/sbin/sshd -t

# 打印配置
/usr/sbin/sshd -T | grep Ciphers

# 以指定加密方式连接
ssh -c 3des-cbc localhost
ssh -c 3des-cbc -o macs=hmac-md5 bakroot02@172.31.96.102
# 或者
ssh <user@ip> -c aes256-cbc -m hmac-sha1

# 追加加密算法 3des-cbc 和 hmac-md5，适合 RHEL8/Kylin V10 以下版本服务器
$ sudo vi //etc/crypto-policies/back-ends/opensshserver.config
/usr/sbin/sshd -D -oCiphers=3des-cbc,aes256-gcm@openssh.com,... -oMACs=hmac-md5,hmac-sha2-256-etm@openssh.com,...

sudo systemctl daemon-reload
sudo systemctl restart sshd

# 追加加密算法 3des-cbc 和 hmac-md5，适合 RHEL7 以下版本服务器
$ sudo vi /etc/ssh/sshd_config 
Ciphers +3des-cbc
MACs +hmac-md5

sudo systemctl restart sshd
```

## 问题

```sh
# WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
ssh-keygen -R <host>

# 查看 OpenSSH 支持哪些算法
man sshd_config 
# 或者
Ciphers: ssh -Q cipher
MACs: ssh -Q mac
KexAlgorithms: ssh -Q kex
PubkeyAcceptedKeyTypes: ssh -Q key

# 查看当前 OpenSSH 启用了哪些算法
sshd -T | grep "\(ciphers\|macs\|kexalgorithms\)"
# 或者
nmap --script ssh2-enum-algos -sV -p 22 127.0.0.1

# ssh 发现很慢才能登录
# 可能是 DNS Server 无法连接所致，先检查 /etc/resolv.conf，可使用 dig 或者 curl 验证
# 临时解决
$ vim /etc/ssh/sshd_config
UseDNS no
systemctl restart sshd
```

## Links

- [如何解決 SSH Server 使用了不安全的加密演算法: ARCFOUR、CBC、HMAC-MD5、HMAC-RIPEMD160](http://www.vixual.net/blog/archives/64)
- [Harden SSH in CentOS 8](https://forums.centos.org/viewtopic.php?t=72948)
- [restart ssh service while users still connected](https://community.spiceworks.com/topic/2091374-restart-ssh-service-while-users-still-connected)
- [How to disable strict host key checking in ssh?](https://askubuntu.com/questions/87449/how-to-disable-strict-host-key-checking-in-ssh)
- [How can I find a list of MACs, Ciphers, and KexAlgorithms that my openssh client supports?](https://superuser.com/questions/868998/how-can-i-find-a-list-of-macs-ciphers-and-kexalgorithms-that-my-openssh-client)
- [How can I list MACs, Ciphers and KexAlogrithms supported by my ssh server?](https://serverfault.com/questions/735176/how-can-i-list-macs-ciphers-and-kexalogrithms-supported-by-my-ssh-server/735288#735288)
- [SSH Slow Login Fix](https://networklessons.com/uncategorized/ssh-slow-login-fix)
