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
```

## 参考

1. [8 ways to speed up your Ansible playbooks](https://www.redhat.com/sysadmin/faster-ansible-playbook-execution)
