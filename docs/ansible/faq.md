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
```

## 参考文献

- [Ubuntu 22.04 - how to properly restart sshd?](https://www.reddit.com/r/ansible/comments/x5xt3b/ubuntu_2204_how_to_properly_restart_sshd/)
- [Ansible delegate_to task trying to ssh](https://stackoverflow.com/questions/45035794/ansible-delegate-to-task-trying-to-ssh)
- [Is it possible to copy a local file to a remove server without using the Copy module?](https://stackoverflow.com/questions/42121346/is-it-possible-to-copy-a-local-file-to-a-remove-server-without-using-the-copy-mo)
- [Error after sudo-ing "sudo: must be setuid root"](https://askubuntu.com/questions/21931/error-after-sudo-ing-sudo-must-be-setuid-root)
- [New Line in an Ansible String](https://stackoverflow.com/questions/61804655/new-line-in-an-ansible-string)
