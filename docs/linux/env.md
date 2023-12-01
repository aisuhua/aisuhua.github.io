# env

关于环境变量

## /etc/environment

```sh
# /etc/environment 只支持以下格式，不支持使用 export 等 shell 语法
VARIABLE_NAME="Value"
```

## 系统和个人环境设置

```sh
# 系统全局的环境设置
登录环境设置文件：/etc/profile
非登录环境设置文件：/etc/bashrc

# 用户个人的环境设置
登录环境设置文件: $HOME/.bash_profile
非登录环境设置文件：$HOME/.bashrc
```

## 参考文献

- [How to Effectively Use the ‘/etc/environment’ File in Linux](https://tecadmin.net/etc-environment-file-in-linux/)
