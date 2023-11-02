# stat

## CPU

```sh
# 查看 CPU 核心数，Socket 物理内核、Core 单核核心数，Thread 单核心线程数
# lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('
CPU(s):              128
Thread(s) per core:  2
Core(s) per socket:  16
Socket(s):           4
```

## 参考

- [What is the meaning of CPU and core in Kubernetes?](https://stackoverflow.com/questions/53255956/what-is-the-meaning-of-cpu-and-core-in-kubernetes)
