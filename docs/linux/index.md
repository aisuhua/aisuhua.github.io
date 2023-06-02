# Linux

## User

```sh
# 加入组
usermod -a -G sudo suhua

# sudo 不需要密码，必须写在 %sudo 组的后面
suhua ALL=(ALL:ALL) NOPASSWD:ALL
```

## Shell

### grep

```sh
# 包含任意一个关键字
grep -E 'google|youtube' file.txt
```

### password

```sh
p=''; for i in {1..2}; do p="${p}"-`< /dev/urandom tr -dc bcefghjkmpqrtvwxyBCEFGHJKMPQRTVWXY2346789 | head -c${1:-4}`; done; echo ${p:1};
```
