# Linux

## 初始化

```sh
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo sed -i 's/SELINUX\=enforcing/SELINUX\=disabled/' /etc/selinux/config
sudo setenforce 0
```

## User

```sh
# 加入组
usermod -a -G sudo suhua

# sudo 不需要密码，必须写在 %sudo 组的后面
suhua ALL=(ALL:ALL) NOPASSWD:ALL

# 将用户加入组
sudo usermod -aG sudo username

# 将用户从组中删除
sudo gpasswd --delete username sudo
```

## Vim

```sh
# 设置一个 tab 等于 2 个空格
cat << EOF | sudo tee -a /etc/vim/vimrc.local
" one tab 2 space
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set softtabstop=0
EOF

# 编辑时出现 1H 奇怪字符
export LANG=en.UTF-8
```

## grep

```sh
# 包含任意一个关键字
grep -E 'google|youtube' file.txt
```

## generate password

```sh

```
