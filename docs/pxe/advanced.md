# 高级使用

```sh
# 读取网络上的 kickstart 文件自动安装
title Reinstall CentOS
kernel /vmlinuz ro ip=192.168.254.44 netmask=255.255.255.0 gateway=192.168.254.220 dns=8.8.8.8 \
    hostname=somehost.tld \
    ks=http://192.168.1.1/ks/kickstart.ks
initrd /initrd.img
```

## Links

- [Is there a way to run kickstart scripts on a pre-existing server?](https://serverfault.com/questions/511957/is-there-a-way-to-run-kickstart-scripts-on-a-pre-existing-server)
