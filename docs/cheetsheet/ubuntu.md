# Ubuntu

## User

```sh
# 加入组
usermod -a -G sudo suhua

# sudo 不需要密码，必须写在 %sudo 组的后面
suhua ALL=(ALL:ALL) NOPASSWD:ALL
```
