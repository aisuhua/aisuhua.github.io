# rsync

```sh
# 传递密码
# https://unix.stackexchange.com/a/626763
rsync --password-file=<(echo "1233456") root@1.2.3.4::abc /def
```
