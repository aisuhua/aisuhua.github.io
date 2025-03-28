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

## 问题

```sh
# 启动时，报错
[lxapp01@rpa04 ~]$ vncserver :1

You will require a password to access your desktops.

Password:
Cannot check password quality: Opening the configuration file failed 
Password quality check failed, please set it correctly.
# 重装 pam 模块试试 
sudo yum reinstall pam pam_pwquality -y
# 重启 vnc 服务
vncserver -kill :1
vncserver :1

# kylin server 安装桌面
yum groupinstall "Server with UKUI GUI"
systemctl set-default graphical.target
```

- [麒麟系统安装图形化桌面](https://www.cnblogs.com/Eduhg/p/18450949)

## Links

- [麒麟V10-server-sp1-sp2-sp3关于vncserver安装及使用](https://blog.csdn.net/u012306701/article/details/137272461)
- [TigerVNC 客户端和服务端下载地址](https://sourceforge.net/projects/tigervnc/)
- [详解远程桌面协议， Linux 和 Windows 间的远程桌面互相访问（RDP、VNC协议）](https://zhuanlan.zhihu.com/p/84798943)
