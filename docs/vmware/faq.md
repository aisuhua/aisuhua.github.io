# 常见问题

## CheetSheet

```sh
# 添加磁盘后，不需要重启虚拟机
echo "- - -" | tee /sys/class/scsi_host/host*/scan
```

## Before you can run VMware several modules must be compiled

解决方法

```
sudo vmware-modconfig --console --install-all
```

- [Before you can run VMware several modules must be compiled](https://unix.stackexchange.com/questions/439529/before-you-can-run-vmware-several-modules-must-be-compiled)
