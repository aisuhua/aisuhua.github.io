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
ansible -i hosts -u bakroot02 --extra-vars ansible_ssh_pass=mypassword -m ping all

# 忽略 Host Key Checking
vim /etc/ansible/ansible.cfg
[defaults]
host_key_checking=False

# 禁止 fact cache
export ANSIBLE_INVENTORY_CACHE=False

# 没有做互信的服务器，密码将有效
[all]
172.31.96.101
172.31.96.102

[all:vars]
ansible_user=bakroot02
ansible_password=suhua123

# 指定具体 IP 执行
ansible all -i "10.168.101.179," -m ping
ansible-playbook -i "10.168.101.179," test.yml
ansible localhost -m setup


# 查看 hosts 列表
ansible all --list-hosts
ansible -i hosts all --list
ansible -i hosts all -m ping
ansible-playbook -i hosts.yaml playbook.yaml

# 命令行指定参数
export ANSIBLE_HOST_KEY_CHECKING=False
ansible -i 172.31.96.101, -u bakroot02 --extra-vars ansible_ssh_pass=mypassword -m ping all
ansible -i 172.31.96.101,172.31.96.102, -u bakroot02 --extra-vars ansible_ssh_pass=mypassword -m ping all

# command 模块，它是默认模块，不支持 pipe 和 redirect
ansible -i hosts.yaml all -a "id"
ansible -i hosts.yaml all -m ansible.builtin.command -a "id"

# shell 模块，支持 pipe 和 redirect
ansible -i hosts.yaml all -m ansible.builtin.shell -a "cat /etc/kylin-release || cat /etc/redhat-release"

# copy 模块，幂等性
ansible -i hosts.yaml all -m ansible.builtin.copy -a "src=/etc/hosts dest=/tmp/hosts"

# file 模块
ansible -i hosts.yaml all -m ansible.builtin.file -a "dest=/tmp/hosts mode=600 owner=1001 group=1001" --become
ansible -i hosts.yaml all -m ansible.builtin.file -a "dest=/opt/suhua owner=bakroot02 group=bakroot02 state=directory" --become
ansible -i hosts.yaml all -m ansible.builtin.file -a "dest=/opt/suhua state=absent" --become

# yum 模块 RHEL 7
ansible -i hosts.yaml all -m ansible.builtin.yum -a "name=vim state=present" --become
ansible -i hosts.yaml all -m ansible.builtin.yum -a "name=vim state=absent" --become

# Kylin V10
ansible -i hosts.yaml all -m ansible.builtin.dnf -a "use_backend=dnf4 name=vim state=present" --become
ansible -i hosts.yaml all -m ansible.builtin.yum -a "use_backend=dnf4 name=vim state=absent" --become

# user 模块
ansible -i hosts.yaml all -m ansible.builtin.user -a "name=foo password=<hash password> state=present" --become
ansible -i hosts.yaml all -m ansible.builtin.user -a "name=foo password=<hash password> state=absent" --become

# service 模块
ansible -i hosts.yaml all -m ansible.builtin.service -a "name=crond state=started" --become
ansible -i hosts.yaml all -m ansible.builtin.service -a "name=crond state=stopped" --become

# setup 模块
ansible -i hosts.yaml all -m ansible.builtin.setup --become

# 只检查不真正执行 --check / -C
ansible -i hosts.yaml all -m ansible.builtin.copy -a "content=foo dest=/tmp/bar.txt" --become --check

# 修改并发数 By default Ansible uses only 5 simultaneous processes
ansible atlanta -a "/sbin/reboot" -f 10

# sudo 执行命令
ansible -i hosts.yaml all -a "/sbin/reboot" --become

# Docker
docker run --rm -it -v $(pwd):/ansible -v ~/.ssh/id_rsa:/root/id_rsa --net host aisuhua/ansible:latest /bin/sh
```

## FAQ

[WARNING]: Platform linux on host 172.31.96.101 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.

```ansible.cfg
[defaults]
interpreter_python=auto_silent
```

## Links

- [the-configuration-file](https://docs.ansible.com/ansible/2.9/reference_appendices/config.html#the-configuration-file)
- [ansible.cfg](https://github.com/ansible/ansible/blob/stable-2.9/examples/ansible.cfg)
- [Module Index](https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html#modules-by-category)
- [Ansible passing ssh username and Password using command line is not working](https://stackoverflow.com/questions/69889074/ansible-passing-ssh-username-and-password-using-command-line-is-not-working)
- [YAML Syntax](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html#yaml-syntax)
- [playbook-keywords](https://docs.ansible.com/ansible/latest/reference_appendices/playbooks_keywords.html#playbook-keywords)
