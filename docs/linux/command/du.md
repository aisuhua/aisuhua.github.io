# du

```sh
# 对统计结果的大小进行排序
du -sh * | sort -h

# 一天内修改过的文件总大小
find /opt/www -type f -mtime -1 -exec du -ch {} + | grep total$
```
