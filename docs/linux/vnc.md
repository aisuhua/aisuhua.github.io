# VNC

```
# 安装
yum install tigervnc-server

# 启动，切换到需远程的普通用户
sudo su - suhua

# 设置密码
vncpasswd
 
# 启动第一个会话，端口 5901
vncserver :1

# 启动多一个会话，端口 5902
vncserver :2

# 查看所有会话
vncserver -list

# 关闭会话
vncserver -kill :2
```

## Links

- [麒麟V10-server-sp1-sp2-sp3关于vncserver安装及使用](https://blog.csdn.net/u012306701/article/details/137272461)
- [TigerVNC 客户端和服务端下载地址](https://sourceforge.net/projects/tigervnc/)
