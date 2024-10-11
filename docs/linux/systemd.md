# Systemd

## Usage

```sh
# 设置默认 runlevel，还有 graphical.target
sudo systemctl set-default multi-user.target

# 切换 runlevel
sudo systemctl isolate multi-user.target

# 143 进程退出状态码
[Service]
SuccessExitStatus=143
```

## Links

- [How To Use Systemctl to Manage Systemd Services and Units](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
- [How to Change Runlevels (targets) in SystemD](https://www.tecmint.com/change-runlevels-targets-in-systemd/)
- [What's the difference between /usr/lib/systemd/system and /etc/systemd/system?](https://unix.stackexchange.com/questions/206315/whats-the-difference-between-usr-lib-systemd-system-and-etc-systemd-system)
- [systemd user services and systemctl --user](https://nts.strzibny.name/systemd-user-services/)
- [unit falling into a failed state (status=143) when stopping service](https://stackoverflow.com/questions/45953678/unit-falling-into-a-failed-state-status-143-when-stopping-service)
- [Kafka installation with systemd](https://gist.github.com/aisuhua/32049049b68aa993f76040d94392b3fe)
- [systemd时代的开机自启动任务](https://systemd-book.junmajinlong.com/auto_tasks_on_boot.html)
