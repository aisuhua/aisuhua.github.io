# Info

```sh
# 查看服务器架构 x86_64
uname -m

# 查看是 64 位还是 32 位 Linux 内核
getconf LONG_BIT

# 查看 CPU 是 32 位还是  64 位，输出结果有 1m 表示是 64 位
grep -o -w 'lm' /proc/cpuinfo | sort -u
```
