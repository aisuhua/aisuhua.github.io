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
*    soft nofile 102400
*    hard nofile 102400
root soft nofile 102400
root hard nofile 102400

*    soft nproc unlimited
*    hard nproc unlimited
root soft nproc unlimited
root hard nproc unlimited

# 当使用 systemd 管理服务时
# vim /etc/systemd/system.conf
DefaultLimitNOFILE=102400:102400
DefaultLimitNPROC=infinity:infinity
```

## Links

- [Linux ulimit](https://www.zfl9.com/ulimit.html)
- [Are limits.conf values applied on a per-process basis?](https://unix.stackexchange.com/questions/55319/are-limits-conf-values-applied-on-a-per-process-basis)
- https://docs.kernel.org/admin-guide/sysctl/fs.html#id6
