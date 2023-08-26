# Book

```sh
# 安装软件
ansible all -m dnf -a 'name=php state=present use_backend=dnf4' --become
ansible all -m yum -a 'name=haproxy state=present' --become

# 管理软件
ansible all -m service -a "name=haproxy state=started" --become

# 装软件
sudo yum -y install net-tools

# 查看主机的关系
ansible-inventory --graph

# 查看主机列表
ansible -i hosts.yaml icms --list-hosts
ansible-playbook -i hosts.yaml playbook.yaml --list-hosts

# 查看 Module 帮助手册
ansible-doc service

# 搜索模块
ansible-doc -l | grep yum

# 检查 playbook 语法是否有误
ansible-playbook playbook.yaml --syntax-check
```

1. [How to install and use Nginx on CentOS 7 / RHEL 7](https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/)

