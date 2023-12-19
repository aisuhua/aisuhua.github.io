# ulimit

```sh
# 查看当前进程打开了多少个文件
# 第一列是打开的文件描述符数量，第二列是进程id
lsof -n | awk '{print $2}' | sort | uniq -c | sort -nr | more

# 查看系统级限制
cat /proc/sys/fs/file-max

# 查看当前用户的文件描述符限制
ulimit -n
```
