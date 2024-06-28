# top

```sh
# 把内容输出到文件
top -bn1 > output.txt

# 查看硬盘序列号
lsblk --nodeps -o name,serial
# 或者 
sudo lshw -class disk
```

## link

- [Is there a way to get "top" to run exactly once and exit?](https://unix.stackexchange.com/questions/147471/is-there-a-way-to-get-top-to-run-exactly-once-and-exit)
- [Harddisk serial number from terminal?](https://unix.stackexchange.com/questions/121757/harddisk-serial-number-from-terminal)
- [How to Find a Hard Disk Serial Number in Linux](https://www.tecmint.com/find-hard-disk-serial-number-linux/)
