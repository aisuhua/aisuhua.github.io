# 用户

## 新增和删除

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

## 修改用户组

将用户加入组

```sh
sudo usermod -aG aisuhua docker
```

将用户从组里剔除

```sh
sudo gpasswd -d aisuhua docker
```

- [How to remove a user from a group?](https://askubuntu.com/questions/80115/how-to-remove-a-user-from-a-group)
