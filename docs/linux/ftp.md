# FTP

## LFTP

使用

```sh
$ lftp 21.123.39.160 -u fhftp
Password:
lftp fhftp@21.123.39.160:~> put c.txt
6 bytes transferred
lftp fhftp@21.123.39.160:~> ls
total 1
-rw-r-----   1 fhftp      fprs             6 Dec  7 12:41 c.txt
```

主动模式

```sh
set ftp:passive-mode off
```

常用命令

```sh
# ls 本地目录内容
!dir 
!dir /opt/www

# 切换本地目录
lcd /tmp

# 查看现在所在本地位置
lpwd
```

