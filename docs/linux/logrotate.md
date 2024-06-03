# logrotate

```sh
# /etc/logrotate.d/applog
/opt/logs/*.log 
/opt/logs/*/*.log 
/opt/logs/*/*/*.log 
{
  size 20M
  rotate 3
  missingok
  notifempty
}

# 手工执行
sudo logrotate /etc/logrotate.d/applog --force --verbose

# 常用参数
# Truncate the original log file to zero size in place after creating a copy, instead of moving the old log file and optionally creating a new one.
copytruncate
```

## 参考文献

- [How To Manage Logfiles with Logrotate on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-manage-logfiles-with-logrotate-on-ubuntu-16-04)
- https://github.com/linkyard/docker-logrotate
