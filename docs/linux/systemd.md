# Systemd

## Usage

```sh
# 设置默认 runlevel，还有 graphical.target
sudo systemctl set-default multi-user.target

# 切换 runlevel
sudo systemctl isolate multi-user.target
```

## Links

- [How To Use Systemctl to Manage Systemd Services and Units](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
- [How to Change Runlevels (targets) in SystemD](https://www.tecmint.com/change-runlevels-targets-in-systemd/)
- [What's the difference between /usr/lib/systemd/system and /etc/systemd/system?](https://unix.stackexchange.com/questions/206315/whats-the-difference-between-usr-lib-systemd-system-and-etc-systemd-system)
