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

## Chapter8

```sh
# 查看详细执行过程
ansible -i hosts.yaml -m ping -vvvv

# 语法检查
ansible-playbook --syntax-check playbook.yml

# 罗列主机
ansible-playbook --list-hosts playbook.yml

# 罗列任务清单
ansible-playbook --list-tasks playbook.yaml

# 试运行 dry run
ansible-playbook --check playbook.yaml

# 查看可能更新到的部分
ansible-playbook --check --diff playbook.yaml

# 只运行指定的 tags role
ansible-playbook --tags=yuminstall playbook.yaml

# 只在指定主机上运行
ansible-playbook --limit 172.31.96.101 playbook.yaml
ansible -i hosts.ini all --limit 172.31.96.102 -m setup
```

## Chapter8

```sh
# 安装 role
ansible-galaxy install oefenweb.ntp

# 查看已安装的 role
ansible-galaxy role list

# 卸载 role
ansible-galaxy remove oefenweb.ntp
```

## Chapter10

```sh
# 查看所有 lookup 类型的组件
ansible-doc  -t lookup --list

# 操作系统相关 fact 变量
"ansible_os_family": "RedHat"
"ansible_distribution": "Kylin Linux Advanced Server"
"ansible_distribution_major_version": "V10"
"ansible_distribution_release": "Tercel"
"ansible_distribution_version": "V10"

# become 无法应用在 include_tasks
tasks:
- ansible.builtin.include_tasks: redhat.yaml
  vars:
    ansible_become: yes

# become 无法应用在 include_role
include_role:
   name: myrole
   apply:
     become: true
```

## Chapter11

```sh
# 分步调试
ansible-playbook playbook.yaml --step
```

## Links

- [Using 'creates' arg in Ansible shell module](https://stackoverflow.com/questions/28468551/using-creates-arg-in-ansible-shell-module)
- [How to install and use Nginx on CentOS 7 / RHEL 7](https://www.cyberciti.biz/faq/how-to-install-and-use-nginx-on-centos-7-rhel-7/)
- [Python 3 Support](https://docs.ansible.com/ansible/latest/reference_appendices/python_3_support.html)
- [how can I specify the version of Python to use in an Ansible playbook?](https://stackoverflow.com/questions/58450608/how-can-i-specify-the-version-of-python-to-use-in-an-ansible-playbook)
- [How to check if a file exists in Ansible?](https://stackoverflow.com/a/47814649)
- [test-syntax](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_tests.html#test-syntax)
- [playbooks_filters.html](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_filters.html)
- [ansible_error_become_is_not_a_valid_attribute_for](https://www.reddit.com/r/ansible/comments/twoyyt/ansible_error_become_is_not_a_valid_attribute_for/)
- [Use ansible_become instead of become in multinode devstack gate](https://opendev.org/openstack/whitebox-tempest-plugin/commit/6218b77c4b16d60eda0df828f6181b38594d611f)
- [How To Use Variables in Ansible Playbooks](https://www.cherryservers.com/blog/how-to-use-variables-in-ansible-playbooks)
- [Ansible - Looking for files and compare their hash](https://stackoverflow.com/questions/70724783/ansible-looking-for-files-and-compare-their-hash)
- [Grouping tasks with blocks](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_blocks.html)
- [Controlling playbook execution: strategies and more](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_strategies.html#setting-the-batch-size-with-serial)
