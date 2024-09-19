# Ansible

## touch 每次执行都是 changed

添加 `access_time: preserve` 和 `modification_time: preserve` 这两个参数，当然你不管它也可以

```yaml
- name: Touch file
  file:
    path: /etc/file.conf
    state: touch
    access_time: preserve
    modification_time: preserve
```

- [file touch always 'changed' - [was: need a separate touch module]](https://github.com/ansible/ansible/issues/30226#issuecomment-433643224)

## forks 的使用

在命令行中使用

```sh
ansible-playbook --forks=1 ...
```

在 ansible.cfg 文件中配置


