# ab

压力测试

## 使用

```sh
$ ab -n 100 -c 10 http://13.209.21.196:8080/trade-server/test/order/testQueue

-n 100表示请求总数为100
-c 10表示并发用户数为10
http://13.209.21.196:8080/trade-server/test/order/testQueue表示请求的目标URL
```

- [网站性能压力测试工具--apache ab使用详解](https://www.cnblogs.com/linjiqin/p/9058432.html)
