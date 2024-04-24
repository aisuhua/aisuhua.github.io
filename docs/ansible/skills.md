# 技巧

## 默认值

```sh
id: "{{ item.state | default(omit) }}"

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
```

## Links

- [How to delete *.web files only if they exist](https://stackoverflow.com/questions/34949595/how-to-delete-web-files-only-if-they-exist)
