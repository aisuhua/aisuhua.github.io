# ps

## 查看状态

```sh
# 查看内存使用情况
ps aux | grep -v PID | sort -rn -k 4 | head
```

## 判断进程是否存在

```sh
command="httpd"
running=`ps ax | grep -v grep | grep $command | wc -l`
if [ $running -gt 0 ]; then
    echo "Command is running"
else
    echo "Command is not running"
fi
```

- [Linux/Unix command to determine if process is running?](https://stackoverflow.com/a/13083285/6693877)
