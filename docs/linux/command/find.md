# find

```sh
# 查找 5 分钟内修改过的文件并排序
find /etc/ -mmin -5 -printf '%TY-%Tm-%Td %TT %p\n' | sort
```
