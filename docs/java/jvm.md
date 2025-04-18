# JVM

## 配置 heap 内存大小

```
-Xms: initial heap size
-Xmx: Maximum heap size

java -Xms128m -Xmx256m demo.java
```

- [How to increase Heap size of JVM](https://stackoverflow.com/questions/6452765/how-to-increase-heap-size-of-jvm)

## 查看默认配置

```sh
# openjdk
java -XX:+PrintFlagsFinal -version

# IBM jdk
java -verbose:sizes -version
```

- [What's the default heap size for IBM's J9VM?](https://stackoverflow.com/questions/1572738/whats-the-default-heap-size-for-ibms-j9vm)

## 查看进程 JVM 启动参数

```sh
jps -lvm

jcmd -l
jcmd $PID VM.system_properties
jcmd $PID VM.flags

jinfo -flags $PID
```

- [Getting the parameters of a running JVM](https://stackoverflow.com/questions/5317152/getting-the-parameters-of-a-running-jvm)
- [Check JVM settings of running java process](https://makandracards.com/operations/531812-check-jvm-settings-running-java-process)

## heap 和 非 heap 内存

- [内存区域：Heap (堆区）](https://www.cnblogs.com/yanliang12138/p/14453698.html)
- [JVM堆内存和非堆内存](https://xstarcd.github.io/wiki/Java/JVM_Heap_Non-heap.html)

## 生成 heapdump

```sh
# 查看帮助
jattach <pid> jcmd help -all

# 查看 heap 和非 heap 内容使用情况
jattach <pid> jcmd GC.heap_info

# 生成 heapdump 文件
jattach <pid> jcmd GC.heapdump /tmp/dump.bin
```

- https://github.com/jattach/jattach
