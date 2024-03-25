# Ansible

```sh
# 以 JSON 格式返回结果
# 修改配置文件 ansible.cfg
[defaults]
callback_whitelist=json
stdout_callback=json

# 通过环境变量 
ANSIBLE_CALLBACK_WHITELIST=json ANSIBLE_STDOUT_CALLBACK=json ansible-playbook ...

# 修改并发数
# ansible.cfg
[defaults]
forks=50

# 命令行参数
ansible-playbook site.yaml --forks 50

# 自定义参数
my_hostname ansible_host=192.168.12.34
```

## 问题

ansible 2.x sudo regression on old systems

```sh
# in 1.9x (ansible.cfg)
sudo_flags = -H

# in 2.x
sudo_flags = -H -S -n
```

## 参考

1. [8 ways to speed up your Ansible playbooks](https://www.redhat.com/sysadmin/faster-ansible-playbook-execution)
2. [ansible 2.x sudo regression on old systems](https://github.com/ansible/ansible/issues/13941)
3. [Is it possible to combine jinja templates in ansible like this is possible with erbs in puppet?](https://devops.stackexchange.com/questions/1558/is-it-possible-to-combine-jinja-templates-in-ansible-like-this-is-possible-with)
