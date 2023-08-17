# Ansible

```sh
# 安装软件 raw 和 script 模块不依赖于 Python，所以可以用它来安装 Python
ansible myhost --become -m raw -a "yum install -y python2"

# Ansible 按照以下顺序读取配置，一旦找到第一个配置文件，其他配置文件将会被忽略
1. ANSIBLE_CONFIG (environment variable if set)
2. ansible.cfg (in the current directory)
3. ~/.ansible.cfg (in the home directory)
4. /etc/ansible/ansible.cfg


```
