# 安装

```sh
# Turn Off RST
Setting > System Configuration > SATA Operation > 选择 AHCI

# sudo
suhua ALL=(ALL) NOPASSWD: ALL

# chrome
sudo dpkg -i chrome-xxx.deb

# ssh
sudo apt install openssh-server \
net-tools \
vim

# 打不开设置
sudo apt-get install gnome-control-center

# 桌面快捷方式
vim /usr/share/applications/windows.desktop
[Desktop Entry]
Type=Application
Name=Windows
GenericName=windows
Icon=/opt/www/windows/windows.png
Exec=/usr/bin/rdesktop -u suhua -p suhua123 -g '1850x1022' 127.0.0.1
Categories=Development;
```
