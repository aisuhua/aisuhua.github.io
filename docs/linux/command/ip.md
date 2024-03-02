# IP

```sh
# 查看所有 IP 地址
ip -4 -o addr | awk '!/^[0-9]*: ?lo|link\/ether/ {print $2" "$4}'
```

## Links

- [Bash script to get all IP addresses](https://stackoverflow.com/questions/12523872/bash-script-to-get-all-ip-addresses)
