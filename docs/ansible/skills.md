# 技巧

## 默认值

```sh
id: "{{ item.state | default(omit) }}"
```

## 删除目录下的所有文件

```
- find:
    paths: /opt/app/jboss/configuration
    patterns: "*.web"
  register: find_results

- file:
    path: "{{ item['path'] }}"
    state: absent
  with_items: "{{ find_results['files'] }}"
```

## JSON

```sh
# 执行时设置环境变量
ANSIBLE_CALLBACK_WHITELIST=json ANSIBLE_STDOUT_CALLBACK=json ansible-playbook ...

# 全局配置 ansible.cfg
[defaults]
callback_whitelist=json
stdout_callback=json
```

## facts

```sh
# 将 facts 保存到本地
- name: save all facts to host specific file
  copy:
    content: "{{ ansible_delegated_vars[inventory_hostname].vars | to_nice_json }}"
    dest: "{{ playbook_dir }}/{{ ansible_fqdn }}"
  delegate_to: localhost
```

## templates vars

```sh
var1: "{{ lookup('template', 'lookup-test.j2', template_vars=dict(variable1='var1')) | trim }}"
var2: "{{ lookup('template', 'lookup-test.j2', template_vars=dict(variable1='var1', variable2='var2')) | trim }}"
```

## delegate_to

```sh
# ansible_host 127.0.0.1
# inventory_hostname 172.31.96.149
# value，hostvars 可以获取该主机的变量
- raw: 'echo "{{ ansible_host }}" "{{ inventory_hostname }} {{ hostvars[inventory_hostname]["key"] }}"'
  register: result
  delegate_to: 127.0.0.1
```

## Links

- [How to delete *.web files only if they exist](https://stackoverflow.com/questions/34949595/how-to-delete-web-files-only-if-they-exist)
- [How do I make ansible-playbook log its output in a machine readable format like xml or json?](https://devops.stackexchange.com/questions/12213/how-do-i-make-ansible-playbook-log-its-output-in-a-machine-readable-format-like)
- [writing ansible facts to a file from a playbook](https://stackoverflow.com/questions/67885939/writing-ansible-facts-to-a-file-from-a-playbook)
- [template_vars are not reset between calls for template lookup #55113](https://github.com/ansible/ansible/issues/55113)
- [Closed
Allow variables to be passed in to lookup](https://github.com/ansible/ansible/issues/6463)
