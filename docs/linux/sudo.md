# sudo

```
# 只允许用户免密切换到指定用户
user-a ALL=(user-b:user-b) NOPASSWD:ALL

# 使用以下命名切换
sudo -u lxapp01 -i
```

## 参考文献

- [How do I allow only one user to su to another account?](https://askubuntu.com/questions/402832/how-do-i-allow-only-one-user-to-su-to-another-account)
