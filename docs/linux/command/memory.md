# Memory

```sh
# 统计内存使用率
free | grep Mem | awk '{print $3/$2 * 100.0}'

# 取整数
free | grep Mem | awk '{ printf("%d", $3/$2 * 100.0) }'
```
