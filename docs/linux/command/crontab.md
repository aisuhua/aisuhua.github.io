# crontab

```sh
# 添加一条定时任务
(crontab -u suhua -l ; echo "*/5 * * * * perl /home/mobman/test.pl") | crontab -u suhua -

# 删除一条定时任务
crontab -u suhua -l | grep -v 'perl /home/mobman/test.pl'  | crontab -u suhua -
```

## Links

- [How to remove or delete single cron job using linux command?](https://askubuntu.com/questions/408611/how-to-remove-or-delete-single-cron-job-using-linux-command)
