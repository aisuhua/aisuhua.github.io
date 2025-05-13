# nc

```sh
# 监听端口
nc -l 8080
nc -lv 8080

# 持续监听
nc -lkv 8080

# 测试网络连通性
$ nc -zv 127.0.0.1 80
Connection to 127.0.0.1 80 port [tcp/http] succeeded!

$ nc -zv 127.0.0.1 90
nc: connect to 127.0.0.1 port 90 (tcp) failed: Connection refused
```
