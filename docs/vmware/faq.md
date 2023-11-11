# 常见问题

## CheetSheet

```sh
# 添加磁盘后，不需要重启虚拟机
echo "- - -" | tee /sys/class/scsi_host/host*/scan

# 调整 NAT 网段
Select Edit > Virtual Network Editor.
Select the host-only or NAT network.
To change the subnet IP address, type a new value in the Subnet IP text box.

# 从网络启动
开机，按 F12
```

## Before you can run VMware several modules must be compiled

解决方法

```
sudo vmware-modconfig --console --install-all
```

## 参考

- [Before you can run VMware several modules must be compiled](https://unix.stackexchange.com/questions/439529/before-you-can-run-vmware-several-modules-must-be-compiled)
- [Change the Subnet Settings for a Host-Only or NAT Network on a Windows Host](https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-AF4C4227-2499-440B-A297-A4097A5C94AA.html)
- [VMware的虚拟网络编辑器，在配置的过程中没有桥接模式！](https://blog.csdn.net/nathan8/article/details/105441646)
- [Network Boot of Virtual Machines (1322)](https://kb.vmware.com/s/article/1322)
