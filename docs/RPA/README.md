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

```

## links

- [银河麒麟liunux下的屏幕保护与锁屏设置](https://blog.csdn.net/brownsnow/article/details/129663789)
- https://github.com/aisuhua/wps-office-19-missing-fonts-on-Linux
- https://gitee.com/aisuhua/ttf-ms-win10
- https://rpm.pkgs.org/packages/google-chrome-x86_64/
- [在Linux主机上登录Windows云服务器](https://support.huaweicloud.com/usermanual-hecs/hecs_03_0080.html)
