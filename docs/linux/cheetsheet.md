# cheetsheet

## 查看序列号

```sh
# > RHEL6
cat /sys/devices/virtual/dmi/id/product_serial

# RHEL5
sudo dmidecode -s system-serial-number
```

## 参考

1. [Extract the Linux serial number without sudo](https://stackoverflow.com/questions/20206474/extract-the-linux-serial-number-without-sudo)
