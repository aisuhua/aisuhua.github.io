# yum

## cheetsheet

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

# 查看软件安装时间
rpm -qa --last rsyslog
```

## 常见问题

### 执行 rpm 命令后一直 hang 住

```sh
# Stop the install command and rebuild your rpm database.
rm /var/lib/rpm/__db*

# 重建 db
rpm --rebuilddb
```

- [RPM command hangs](https://serverfault.com/questions/622671/rpm-command-hangs)
