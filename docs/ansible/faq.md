# 常见问题

```
# Unable to restart service sshd: Failed to restart sshd.service: Connection timed out\nSee system logs and 'systemctl status sshd.service' for details.
# Unable to restart service sshd: Failed to restart sshd.service: Method call timed out\nSee system logs and 'systemctl status sshd.service' for details.
# 要注意给 handlers 添加 become: true
handlers:
- name: restart ssh
  become: true
  service:
    name: sshd
    state: restarted

# sudo: must be setuid root
chown root:root /usr/bin/sudo
chmod 4755 /usr/bin/sudo

# 检查 IP 是否在某个组里面
# when: inventory_hostname in groups["<group name>"]
when: inventory_hostname in groups["appservers"]

# 磁盘单位
kibibyte (k or KiB) - 1024 bytes
kilobyte (K or KB) - 1000 bytes
mebibyte (m or MiB) - 1024 kibibytes
megabyte (M or MB) - 1000 kilobytes
gibibyte (g or GiB) - 1024 mebibytes
gigabyte (G or GB) - 1000 megabytes
tebibyte (t or TiB) - 1024 gibibytes
terabyte (T or TB) - 1000 gigabytes
pibibyte (p or PiB) - 1024 tebibytes
petabyte (P or PB) - 1000 gigabytes
exbibyte (e or EiB) - 1024 pibibytes
exabyte (E or EX) - 1000 petabytes
```

## 参考文献

- [Ubuntu 22.04 - how to properly restart sshd?](https://www.reddit.com/r/ansible/comments/x5xt3b/ubuntu_2204_how_to_properly_restart_sshd/)
- [Ansible delegate_to task trying to ssh](https://stackoverflow.com/questions/45035794/ansible-delegate-to-task-trying-to-ssh)
- [Is it possible to copy a local file to a remove server without using the Copy module?](https://stackoverflow.com/questions/42121346/is-it-possible-to-copy-a-local-file-to-a-remove-server-without-using-the-copy-mo)
- [Error after sudo-ing "sudo: must be setuid root"](https://askubuntu.com/questions/21931/error-after-sudo-ing-sudo-must-be-setuid-root)
- [New Line in an Ansible String](https://stackoverflow.com/questions/61804655/new-line-in-an-ansible-string)
- [How to set a task to run for a specific inventory group?](https://serverfault.com/questions/1074397/how-to-set-a-task-to-run-for-a-specific-inventory-group)
- [Ansible - Manage LVM logical volumes using the lvol module](https://www.freekb.net/Article?id=3073)
- [Closed add optional backup_dir for the backup option](https://github.com/ansible/ansible/issues/16305)
