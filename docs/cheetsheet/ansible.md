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

该参数指定了 task 每次最多能在多少台机器上执行

在命令行中使用

```sh
ansible-playbook --forks=100 ...
```

在 ansible.cfg 文件中配置

```cfg
[defaults]
forks=100
```

## run_once 的使用

只在其中一台服务器执行该 task，一般是第一台

```yaml
- name: First task that will only be run on dns.example.com
  command: echo "This is the first task"
  run_once: true
```

## if else 的使用

在 task 的字段中使用

```sh
# 注意它的语法是 'value1' if xxx else 'value1'
# 同时，要判断变量是否为 true，需使用 filter variable | bool 这样的写法
- debug:
  msg: "{{ '/usr/sbin/nologin' if nginx_run_noshell is defined and (nginx_run_noshell | bool) else '/bin/bash' }}"

# omit 关键字的使用，它可以忽略该字段
- user:
    password: "{{ nginx_run_pass | password_hash('sha512', 'suhua123') if nginx_run_pass is defined else omit }}"

# 在 when 中使用
when:
  - nginx_run_noshell | bool

# not 否定
when: not nginx_status.stat.exists
```

- [Ansible "when variable == true" not behaving as expected](https://stackoverflow.com/a/50959087)

## password_hash 的使用

在 ansible 中使用明文的用户密码，当然你也可以用 ansible-vault

```yaml
- user:
    password: "{{ mypassword | password_hash('sha512', 'saltsecret') }}"
```

如果你不想别人知道密码，也可以定义一个加密后的密码，使用下面方法生成密码

```sh
ansible -i localhost, all -m debug -a "msg={{ 'mypassword' | password_hash('sha512') }}"
```












