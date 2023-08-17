# Shell

## 执行历史记录

```sh
# 将缓冲区内容报错到 ~/.bash_history
history -w

# 清空缓冲区内容
history -c

# 显示时间戳
export HISTTIMEFORMAT='%F %T '

# 持久化配置，写入 /etc/profile
echo "export HISTTIMEFORMAT='%F %T '" >> /etc/profile
source /etc/profile

# 将所有执行过的命名记录到文件
export HISTORY_FILE=/var/log/audit_history.log
export PROMPT_COMMAND='{ date "+%y-%m-%d %T ##### $(who am i |awk "{print \$1\" \"\$2\" \"\$5}")  #### $(history 1 | { read x cmd; echo "$cmd"; })"; } >> $HISTORY_FILE'
```
