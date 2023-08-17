# Ansible

```sh
# 安装软件 raw 和 script 模块不依赖于 Python，所以可以用它来安装 Python
ansible myhost --become -m raw -a "yum install -y python2"
```
