# become

```sh
# 提取以 root 身份执行
- do: something
  become: true

# 切换到指定用户执行
- do: something
  become: true
  become_user: nginx
```

- [Difference between become and become_user in Ansible](https://stackoverflow.com/questions/38290143/difference-between-become-and-become-user-in-ansible)


