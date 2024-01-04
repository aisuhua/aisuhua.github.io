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
```
