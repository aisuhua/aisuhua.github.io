# locale

```
# 所有语言清单在 /etc/locale.gen，需要取消注释才能生效
#en_SG ISO-8859-1
en_US.UTF-8 UTF-8
#en_US ISO-8859-1

# 然后执行生成 locale
locale-gen

# 查看当前语言
locale
localectl status

# 查看支持的语言列表
locale -a
localectl list-locales

# 修改语言
localectl set-locale LANG=en_US.UTF-8

# 或者直接修改 /etc/locale.conf
LANG=en_US.UTF-8

# 修改后需要重新登录才能生效，通过以下方法立即生效
unset LANG
# RHEL7
source /etc/profile.d/lang.sh 
# archlinux
source /etc/profile.d/locale.sh
```

## Links

- https://wiki.archlinux.org/title/locale
