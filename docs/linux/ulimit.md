# ulimit

```sh
# 查看当前进程打开了多少个文件
# 第一列是打开的文件描述符数量，第二列是进程id
lsof -n | awk '{print $2}' | sort | uniq -c | sort -nr | more

# 查看系统级限制
cat /proc/sys/fs/file-max

# 查看当前用户的文件描述符限制
ulimit -n

# 查看特定进程的资源限制
cat /proc/<pid>/limits

# 操作系统层面
# 查看单个进程最大可打开文件数
# cat /proc/sys/fs/nr_open
1048576

# 操作系统所有进程总共不能超过该值
# cat /proc/sys/fs/file-max
6815744

# cat /proc/sys/fs/file-nr
# 已分配的句柄数 未使用的句柄数 file-max 值
22016	0	6815744

# 修改 nr_open 和 file-max 值
# vim /etc/sysctl.conf
fs.nr_open = 10000000
fs.file-max = 500000000

# 进程或者用户层面
# vim /etc/security/limits.conf
# pam_limits.so 会读取该配置
# RLIMIT_NOFILE
# 进程可打开的最大文件数，影响open、pipe、dup等调用，达到限制时会返回EMFILE错误
# RLIMIT_NPROC
# 实际运行进程的用户所能运行的最大进程数（在linux里更准确的说法是线程），如果达到这个限制，fork调用返回EAGAIN
*    soft core 102400 # 应用程序转储文件最小值，单位kb （硬限制）
*    hard core 102400 # 应用程序转储文件最大值，单位kb （软限制）
root soft core 102400
root hard core 102400

*    soft nofile 102400 # 单个程序打开的最大文件句柄数 （软限制）
*    hard nofile 102400 # 单个程序打开的最大文件句柄数 （硬限制）
root soft nofile 102400
root hard nofile 102400

*    soft nproc unlimited # 单个程序创建的最大线程数 （软限制）
*    hard nproc unlimited # 单个程序创建的最大线程数 （硬限制）
root soft nproc unlimited
root hard nproc unlimited



# 当使用 systemd 管理服务时
# vim /etc/systemd/system.conf
DefaultLimitCORE=102400:102400
DefaultLimitNOFILE=102400:102400
DefaultLimitNPROC=infinity:infinity


# 查看 multi-user 模式下的服务
ls /etc/systemd/system/multi-user.target.wants/
ls /etc/systemd/system/graphical.target.wants/
```

## Links

- [Linux ulimit](https://www.zfl9.com/ulimit.html)
- [Are limits.conf values applied on a per-process basis?](https://unix.stackexchange.com/questions/55319/are-limits-conf-values-applied-on-a-per-process-basis)
- https://docs.kernel.org/admin-guide/sysctl/fs.html#id6
- [systemd user instances](https://nick.groenen.me/notes/systemd-user-instances/)
- [systemd/User](https://wiki.archlinux.org/title/Systemd/User)
- [Linux下的resource limits(ulimit)](https://www.ichenfu.com/2019/07/18/linux-rlimits/)
