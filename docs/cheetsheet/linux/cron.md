# cron

## 允许普通用户使用 contab 命令

有些发行版，如 RHEL 和 Kylin 等，默认不允许普通用户使用 crontab 配置定时任务，在一个分工不是那么明确的组织里或者其他原因，有时候授予普通用户也可以配置定时任务

```sh
# 允许 suhua 使用 crontab 
echo 'suhua' >> /etc/cron.allow
```

或者允许所有人使用 crontab，它的规则很简单，如果 /etc/cron.allow 文件存在，则用户必须在该文件才能使用 crontab。而如果 /etc/cron.allow 不在，但是 /etc/cron.deny 存在，则除了在 /etc/cron.deny 的用户不能使用 crontab 外，其他人都可以。

```sh
rm -f /etc/cron.allow
touch /etc/cron.deny
chmod 600 /etc/cron.deny
```

- [How to allow or deny users the `cron` or `at` command.](https://access.redhat.com/solutions/1535573)
