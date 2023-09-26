# yum

```
# 搜索软件
yum search nginx

# 查看软件版本
yum list nginx --showduplicates

# 查看已安装的所有软件
yum list installed

# 或者
rpm -qa

# 查看软件是否已安装
rpm -q nginx

# 查看已安装软件的所有文件
rpm -ql nginx
repoquery -l nginx
dnf repoquery -l time

# disable gpg signature checking
rpm install --nogpgcheck
```
