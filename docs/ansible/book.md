# Book

```sh
# 安装软件
ansible all -m dnf -a 'name=php state=present use_backend=dnf4' --become
ansible all -m yum -a 'name=haproxy state=present' --become

# 管理软件
ansible all -m service -a "name=haproxy state=started" --become

# 装软件
sudo yum -y install net-tools
```

