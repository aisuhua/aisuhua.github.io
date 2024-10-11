# yum

## cheetsheet

```
# 查看软件更新记录
yum history list

yum history info <ID>

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

# 查看某个文件属于哪个安装包
rpm -qf /etc/pki/tls/certs/ca-bundle.crt

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

# 升级和降级
yum update vsftpd
yum downgrade vsftpd-2.0.5-12.el5

yum install screen
yum history
yum history undo 8
```

## Links

- [RPM command hangs](https://serverfault.com/questions/622671/rpm-command-hangs)
- [How to check what package was updated using yum history?](https://superuser.com/questions/1235352/how-to-check-what-package-was-updated-using-yum-history)
- [How to use yum/dnf to downgrade or rollback some package updates?](https://access.redhat.com/solutions/29617)
- [How to use yum history to roll back an update in Red Hat Enterprise Linux?](https://access.redhat.com/solutions/64069)
