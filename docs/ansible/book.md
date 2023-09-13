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

# 语法检查
ansible-playbook playbook.yaml --syntax-check
ansible-playbook playbook.yaml --check

# 查看 Module 帮助手册
ansible-doc service

# 搜索模块
ansible-doc -l | grep yum

# 检查 playbook 语法是否有误
ansible-playbook playbook.yaml --syntax-check
```

## Inventory

```sh
# 最简单的 inventory
ansible all -i 'localhost,' -a date

# 查看 inventory 插件
ansible-doc -t inventory -l

# 简单执行
ansible -i 'localhost,' all -a date

# 查看 facts
ansible -i hosts.ini all -m setup
ansible -i hosts.ini all -m setup -a 'filter=ansible_all_ipv4_addresses'
ansible -i hosts.ini all -m setup -a 'filter=ansible_env'

# 命令行传递变量
ansible-playbook playbook.yaml  -e "greeting=hello"
```

## Chapter7

```sh
# 安装依赖
sudo apt-get install libjpeg-dev zlib1g-dev

# 查看 task 清单 
ansible-playbook --list-tasks playbook.yaml

# 免费域名解析
192.168.1.5.nip.io
www.192.168.1.5.nip.io

# 指定 ansible_python_interpreter 执行
ansible-playbook playbook.yaml  -e 'ansible_python_interpreter=/usr/bin/python3'
```


## Links

- [Using 'creates' arg in Ansible shell module](https://stackoverflow.com/questions/28468551/using-creates-arg-in-ansible-shell-module)
- [How to install and use Nginx on CentOS 7 / RHEL 7](https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/)
- [Python 3 Support](https://docs.ansible.com/ansible/latest/reference_appendices/python_3_support.html)
- [how can I specify the version of Python to use in an Ansible playbook?](https://stackoverflow.com/questions/58450608/how-can-i-specify-the-version-of-python-to-use-in-an-ansible-playbook)

