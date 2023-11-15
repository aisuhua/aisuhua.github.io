# Memory

```sh
# 统计内存使用率
free | grep Mem | awk '{print $3/$2 * 100.0}'

# 取整数
free | grep Mem | awk '{ printf("%d", $3/$2 * 100.0) }'
```

##　参考

1. [How to get the percentage of memory free with a Linux command?](https://stackoverflow.com/questions/10585978/how-to-get-the-percentage-of-memory-free-with-a-linux-command)
