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
```

## 问题

```sh
# WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
ssh-keygen -R <host>
```

## Links

- [如何解決 SSH Server 使用了不安全的加密演算法: ARCFOUR、CBC、HMAC-MD5、HMAC-RIPEMD160](http://www.vixual.net/blog/archives/64)
