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
```

## 参考文献

- [Ubuntu 22.04 - how to properly restart sshd?](https://www.reddit.com/r/ansible/comments/x5xt3b/ubuntu_2204_how_to_properly_restart_sshd/)
