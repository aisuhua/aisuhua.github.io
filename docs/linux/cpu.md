# CPU

```sh
# CPUs = Threads per core X cores per socket X sockets
$ lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('
CPU(s):                8  # 
Thread(s) per core:    2  # 每核的线程数
Core(s) per socket:    4  # 每颗 CPU 的核数
Socket(s):             1  # CPU 颗数

# 获取 CPU 厂商名称
$ lscpu | sed -nr '/Model name/ s/.*:\s*(.*) @ .*/\1/p'
Intel(R) Atom(TM) CPU  Z3735F
```

## Links

- [How to know number of cores of a system in Linux?](https://unix.stackexchange.com/questions/218074/how-to-know-number-of-cores-of-a-system-in-linux)
- [How do I get the model name of my processor?](https://askubuntu.com/questions/988440/how-do-i-get-the-model-name-of-my-processor)
