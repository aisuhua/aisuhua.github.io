# 技巧

```sh
# 如果值不存在，则忽略改值
id: "{{ item.state | default(omit) }}"

# 删除目录下的所有文件
- find:
    paths: /opt/logs
    patterns: "*.log"
  register: find_results

- file:
    path: "{{ item['path'] }}"
    state: absent
  with_items: "{{ find_results['files'] }}"

# 返回 JSON 数据
# 通过配置环境变量
ANSIBLE_CALLBACK_WHITELIST=json ANSIBLE_STDOUT_CALLBACK=json ansible-playbook ...
# 全局配置 ansible.cfg
[defaults]
callback_whitelist=json
stdout_callback=json

# 向 template 模块传递变量
var1: "{{ lookup('template', 'lookup-test.j2', template_vars=dict(variable1='var1')) | trim }}"
var2: "{{ lookup('template', 'lookup-test.j2', template_vars=dict(variable1='var1', variable2='var2')) | trim }}"

# connection 和 delegate_to 的区别
# The main difference between connection and delegate_to is that connection can be used at a play or task level, 
# whereas delegate_to operates at a task level only.
# 通过命令行
ansible-playbook playbook.yml --connection=local

# 在 playbook 配置
- hosts: 127.0.0.1
  connection: local

# 只在一台主机上执行 
run_once: true

# if else 使用
debug: 
  msg: "{{ 'me' if st.stat.exists else 'you' }}"

# in 条件的使用
when: 'item.id | string not in sh_vlan_id'

# 多行模式
shell: |
  This text
  has multiple
  lines
```

## Links

- [How to delete *.web files only if they exist](https://stackoverflow.com/questions/34949595/how-to-delete-web-files-only-if-they-exist)
- [How do I make ansible-playbook log its output in a machine readable format like xml or json?](https://devops.stackexchange.com/questions/12213/how-do-i-make-ansible-playbook-log-its-output-in-a-machine-readable-format-like)
- [writing ansible facts to a file from a playbook](https://stackoverflow.com/questions/67885939/writing-ansible-facts-to-a-file-from-a-playbook)
- [template_vars are not reset between calls for template lookup #55113](https://github.com/ansible/ansible/issues/55113)
- [ClosedAllow variables to be passed in to lookup](https://github.com/ansible/ansible/issues/6463)
- [Ansible - what is the purpose of the key "run_once" in a task file.yml?](https://serverfault.com/questions/1012879/ansible-what-is-the-purpose-of-the-key-run-once-in-a-task-file-yml)
- [Controlling where tasks run: delegation and local actions](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_delegation.html)
- [How to do multiline shell script in Ansible](https://stackoverflow.com/questions/40230184/how-to-do-multiline-shell-script-in-ansible)
- [ansible if else construct](https://stackoverflow.com/questions/42037814/ansible-if-else-construct)
- [[WARNING]: when statements should not include jinja2 templating delimiters](https://stackoverflow.com/questions/42673045/warning-when-statements-should-not-include-jinja2-templating-delimiters)
- [How to do multiline shell script in Ansible](https://stackoverflow.com/questions/40230184/how-to-do-multiline-shell-script-in-ansible)
- [Ansible unarchive exclude syntax](https://stackoverflow.com/questions/59182094/ansible-unarchive-exclude-syntax)
- [connection: local vs delegate_to: localhost](https://willthames.github.io/2018/07/01/connection-local-vs-delegate_to-localhost.html)
- [Running Your Ansible Playbooks in Parallel and other strategies](https://toptechtips.github.io/2023-06-26-ansible-parallel/)
