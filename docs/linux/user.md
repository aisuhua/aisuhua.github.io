# 用户

```sh
# 添加用户
useradd user01 && echo PASSWORD | passwd --stdin user01

# 分离步骤
useradd user01
passwd user01

userdel user01

# 连同家目录一起删除
# userdel -r user01
```


