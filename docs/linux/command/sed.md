# sed

```sh
# 替换字符串
sed 's/r"LVM version:.*"/"xxx"/g' hello

# 修改原文件前备份文件
sed -i.bak ... /etc/login.defs

# 备份文件添加日期
NOW=$(date "+%Y%m%d%H%M%S")
sed -i.${NOW} ... /etc/login.defs
```
