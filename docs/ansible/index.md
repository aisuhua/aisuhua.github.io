# Ansible

```sh
# 安装软件 raw 和 script 模块不依赖于 Python，所以可以用它来安装 Python
ansible myhost --become -m raw -a "yum install -y python2"

# Ansible 按照以下顺序读取配置，一旦找到第一个配置文件，其他配置文件将会被忽略
1. ANSIBLE_CONFIG (environment variable if set)
2. ansible.cfg (in the current directory)
3. ~/.ansible.cfg (in the home directory)
4. /etc/ansible/ansible.cfg

# 用账号密码登录
ansible -i hosts -u bakroot02 --extra-vars ansible_ssh_pass=suhua123 -m ping all
```

## Links

- [the-configuration-file](https://docs.ansible.com/ansible/2.9/reference_appendices/config.html#the-configuration-file)
- [ansible.cfg](https://github.com/ansible/ansible/blob/stable-2.9/examples/ansible.cfg)
- [Module Index](https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html#modules-by-category)
