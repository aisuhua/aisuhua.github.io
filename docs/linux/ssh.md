# SSH

## 使用

```sh
# Disable strict host key checking
ssh -o StrictHostKeyChecking=no user@remote-host 
```

# 配置

```sh
# 查看帮助信息
man sshd_config 

# 查看所支持的所有加密算法
ssh -Q cipher
```

## 问题

```sh
# WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
ssh-keygen -R <host>
```
