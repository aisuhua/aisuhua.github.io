# 操作系统初始化

## 修改主机名

```sh
# rhel5/6
# 马上生效（重启后无效）
hostname server
# /etc/sysconfig/network
HOSTNAME=server
# /etc/hosts
127.0.0.1 server

# rhel7/8、Kylin V7/V10
hostnamectl set-hostname server
# /etc/hosts
127.0.0.1 server
```

## 镜像源

```sh
# 内容详见 repo/

# Kylin V10
/etc/yum.repos.d/kylin_x86_64.repo

# Kylin V7update6
/etc/yum.repos.d/kns7-adv.repo

# RedHat
/etc/yum.repos.d/redhat.repo
```

## 安装软件

```sh
yum -y install telnet
yum -y install net-tools
yum -y install nc
yum -y install unzip
yum -y install ftp
yum -y install bc
yum -y install lrzsz
yum -y install chrony
yum -y install traceroute
yum -y install tar
yum -y install vim
yum -y java
```

## 防火墙

```sh
# Flush the selected chain (all the chains in the table if none is given). This is equivalent to deleting all the rules one by one.
iptables -F

# Delete the optional user-defined chain specified.
iptables -X

# 入流量默认禁止
iptables -P INPUT DROP

# 出去流量默认允许
iptables -P OUTPUT ACCEPT

# 允许本机访问
iptables -A INPUT -s 127.0.0.1 -j ACCEPT
# 或者
iptables -A INPUT -i lo -j ACCEPT
# 接受 ping
iptables -A INPUT -p icmp -j ACCEPT
# ??
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# 放开常用端口
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# 整段放开
iptables -A INPUT -s 21.144.204.0/24 -j ACCEPT
# 或者整段放开，除了 22 端口不能访问外
iptables -A INPUT -p tcp -s 21.144.204.0/24 ! --dport 22 -j ACCEPT
# 允许访问特定协议特定端口
iptables -A INPUT -s 21.144.204.2/32 -p tcp --dport 10001 -j ACCEPT
# 允许特定终端访问
iptables -A INPUT -s 21.144.226.2/24 -j ACCEPT

# 持久化保存 iptables 规则
iptables-save > /etc/sysconfig/iptables
# 或者执行，只有在安装了 iptables-service 服务命令才有效
service iptables save
# 启动 iptables-service 服务
systemctl start iptables.service --now
```

## 创建用户

```sh
# 新增用户
useradd bakroot01; echo PASSWORD | passwd --stdin bakroot01
useradd bakroot; echo PASSWORD | passwd --stdin bakroot
useradd bakroot02; echo PASSWORD | passwd --stdin bakroot02
useradd lxchk; echo PASSWORD | passwd --stdin lxchk
useradd lxapp01; echo PASSWORD | passwd --stdin lxapp01

# 允许免密切换到 root
echo "bakroot   ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
echo "bakroot01   ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
echo "bakroot02   ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
```

## 操作记录

```sh
# 默认格式
# history
57  reboot
58  ip a
59  ls

# 带时间格式
# HISTTIMEFORMAT="%F %T: "
# history
57  2024-03-12 13:00:21: reboot
58  2024-03-12 13:00:27: ip a
59  2024-03-12 13:00:45: ls

# 其他另类格式
# HISTTIMEFORMAT="`who am i |xargs -x echo` || "
# history
57  root pts/0 2024-03-12 13:00 (172.31.96.1) || reboot
58  root pts/0 2024-03-12 13:00 (172.31.96.1) || ip a
59  root pts/0 2024-03-12 13:00 (172.31.96.1) || ls
```

## 关闭安全设置

```sh
# 关闭防火墙
systemctl disable firewalld --now

# 关闭 selinux
sed -i 's/SELINUX\=enforcing/SELINUX\=disabled/' /etc/selinux/config
reboot

# 临时关闭，重启后失效
setenforce 0
```

## 时间服务

```sh
# /etc/chrony.conf
# 当时间服务器用域名而不是 IP，且该域名解析到多个不同 IP 时，应使用 pool
pool ntp.aliyun.com iburst

# 或者用 server
server 0.rhel.pool.ntp.org iburst
server 1.rhel.pool.ntp.org iburst
server 2.rhel.pool.ntp.org iburst

# prefer 表示默认用该服务器，只要该时间服务器可用默认就会用它
# 可以保证所有服务器都使用相同的时间服务器
server 192.168.0.51 iburst prefer

# 查看当前状态
chronyc tracking
chronyc sources -v

# 手工执行时间同步
chronyc -a makestep

# 查看当前系统时间
timedatectl

# 查看所有时区
timedatectl list-timezones

# 修改当前时区为东八区
timedatectl set-timezone Asia/Shanghai
```

## 安全策略

```sh
# 修改密码过期时间
# Minimum number of days between password change : 0
# Maximum number of days between password change : 90
chage -M 90 -m 0 lxapp01

# 查看密码过期时间
chage -l lxapp01

# 当用户密码过期时（非 PAM）
# 配置后再使用 useradd 添加用户则生效
# 全局配置密码复杂度和过期时间
# /etc/login.defs
# 密码 90 天过期
PASS_MAX_DAYS   90 
# 最小修改间隔时间
PASS_MIN_DAYS   0
# 密码最小长度 8 位
PASS_MIN_LEN    8
# 最小警告时间
PASS_WARN_AGE   7

# 当用户使用 passwd 修改密码或者登录时输入密码
# 配置 pam_pwquality.so 检查密码强度（适合 RHEL7/8、Kylin V7/V10）
# RHEL7 开始默认使用 pam_pwquality.so（代替 pam_cracklib.so） 
# dcredit=-1 至少包含1个数字
# lcredit=-1 至少包含一个小写字母
# ucredit=-1 至少包含一个大写字母      
# ocredit=-1 至少包含一个特殊字符
# retry=6 密码输入可尝试错误次数为 6 次
# minlen=8 密码最短长度为 8
# enforce_for_root 强制让 root 修改用户密码时要符合该要求
# /etc/pam.d/system-auth 或者修改 /etc/security/pwquality.conf
# RHEL 系列操作系统还需修改 /etc/pam.d/password-auth
password    requisite     pam_pwquality.so try_first_pass local_users_only retry=6 authtok_type= minlen=8 ocredit=-1 ucredit=-1 lcredit=-1 dcredit=-1 enforce_for_root
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok

# 配置 pam_cracklib 检查密码强度（适合 RHEL5/6）
# RHEL5/6 不支持的参数：local_users_only
# RHEL5 不支持的参数：authtok_type=、enforce_for_root
password    requisite     pam_cracklib.so try_first_pass retry=6 minlen=8 ocredit=-1 ucredit=-1 lcredit=-1 dcredit=-1
# RHEL6
password    sufficient    pam_unix.so sha512 shadow nullok try_first_pass use_authtok
# RHEL5 加密方式默认是 md5
password    sufficient    pam_unix.so md5 shadow nullok try_first_pass use_authtok

# 当用户密码输入次数过多时锁定几分钟
# onerr=fail 当模块发生错误时则当作被锁定处理
# deny=6 输入错误密码次数超过 6 次则被锁
# unlock_time=300 普通用户被锁定时间 300 秒则 5 分钟
# root_unlock_time=300 root 用户被锁定时间
# 配置 pam_tally2.so 当用户输入
auth        required      pam_tally2.so  onerr=fail deny=6 unlock_time=300 even_deny_root root_unlock_time=300
```

## 登录设置

```sh
# 临时生效，5分钟自动退出
export TMOUT=300

# 对所有用户生效
# vim /etc/profile
export TMOUT=300
# 避免 TMOUT 被其他人重写
readonly TMOUT

# 取消超时退出
# vim /etc/profile
export TMOUT=0

# 登录策略
# LOG_UNKFAIL_ENAB 当用户登录失败时，将用户名记录到日志
# LOGIN_RETRIES 用户输入密码最大错误次数，超过则会报错退出，但是改值会被 pam_pwquality.so 模块的 retry=6 参数重写
# LASTLOG_ENAB 开启登录日志记录功能，且会将登录时间信息记录到日志 /var/log/lastlog

# vim /etc/login.defs
LOG_UNKFAIL_ENAB   yes
LOGIN_RETRIES  6
LASTLOG_ENAB   yes
```

## Ref

- [CentOS Linux 5/6 Change Hostname Command](https://www.cyberciti.biz/faq/centos-hostname-change-command-line/)
- [RHEL / Centos Linux 7: Change and Set Hostname Command](https://www.cyberciti.biz/faq/rhel-redhat-centos-7-change-hostname-command/)
- [Linux Password Enforcement with PAM](https://deer-run.com/users/hal/linux_passwords_pam.html)
- [Linux Password Security with pam_cracklib](https://deer-run.com/users/hal/sysadmin/pam_cracklib.html)
- https://man7.org/linux/man-pages/man5/login.defs.5.html
- https://linux.die.net/man/5/login.defs
