# 技巧

```sh
# 如没有提供相关参数则忽略
id: "{{ item.state | default(omit) }}"

# 删除目录下的所有文件
- find:
    paths: /opt/app/jboss/configuration
    patterns: "*.web"
  register: find_results

- file:
    path: "{{ item['path'] }}"
    state: absent
  with_items: "{{ find_results['files'] }}"
```

## Links

- [How to delete *.web files only if they exist](https://stackoverflow.com/questions/34949595/how-to-delete-web-files-only-if-they-exist)
