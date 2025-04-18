# RPA

```sh
# install wps
unzip wps.zip
cd wps
rpm -ivh wps-office-10.1.0.6634-1.x86_64.rpm

unzip wps-office-19-missing-fonts-on-Linux-main.zip
mv wps-office-19-missing-fonts-on-Linux-main special-wps-office-fonts
cp -r ttf-ms-win10 /usr/share/fonts/

unzip ttf-ms-win10-master.zip
mv ttf-ms-win10-master ttf-ms-win10
cp -r ttf-ms-win10 /usr/share/fonts/

sudo fc-cache -f -v

# 注意要先配置好 yum 源
# install chrome
yum localinstall google-chrome-stable-133.0.6943.126-1.x86_64.rpm

# 从 Linux 访问 Windows
apt install rdesktop
rdesktop -u administrator -p password -g 1024x720 192.168.x.x
rdesktop -u 'DOMAIN\sysadmin' -p password -g 1920x1024 192.168.x.x

## 开机自启动
cp /usr/lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
# 按需修改用户等参数
systemctl daemon-reload
systemctl enable --now vncserver@:1.service

# 示例
sudo vim /etc/systemd/system/vncserver@:1.service
[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target

[Service]
Type=forking
WorkingDirectory=/home/lxapp01
User=lxapp01
Group=lxapp01

PIDFile=/home/lxapp01/.vnc/%H%i.pid

ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
ExecStart=/usr/bin/vncserver %i
ExecStop=/usr/bin/vncserver -kill %i

Restart=on-success
RestartSec=15

[Install]
WantedBy=multi-user.target

## VNC 连接后非中文桌面
sudo localectl set-locale LANG=zh_CN.UTF-8
vim /home/lxapp01/xstartup
追加中文编码
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
```

## links

- [银河麒麟liunux下的屏幕保护与锁屏设置](https://blog.csdn.net/brownsnow/article/details/129663789)
- https://github.com/aisuhua/wps-office-19-missing-fonts-on-Linux
- https://gitee.com/aisuhua/ttf-ms-win10
- https://rpm.pkgs.org/packages/google-chrome-x86_64/
- [在Linux主机上登录Windows云服务器](https://support.huaweicloud.com/usermanual-hecs/hecs_03_0080.html)
- [RHEL7 安装VNCServer并设置开机自启](https://www.cnblogs.com/linagcheng/p/15768107.html)
- https://gist.github.com/spinxz/1692ff042a7cfd17583b
- [【Kylin】在麒麟系统上安装与更新火狐Firefox浏览器](https://zhuanlan.zhihu.com/p/713918818)
