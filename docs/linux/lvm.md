# LVM

添加磁盘

```
# 不重启 VM，将新磁盘加到操作系统
echo "- - -" | tee /sys/class/scsi_host/host*/scan

# 查看块设备
lsblk
```

划分分区

```sh
# 分区类型选择 Linux LVM 即 8e
fdisk /dev/sdb
```
创建 PV
```sh
# 将 3 个分区都创建为 PV
pvcreate /dev/sdb{1,2,3}

# 或者单独逐个创建
pvcreate /dev/sdb1
pvcreate /dev/sdb2
pvcreate /dev/sdb3

# 查看创建出来的 PV
pvscan
pvdisplay
```

创建 VG

```sh
# 创建一个包含 3 个 PV 的 VG
vgcreate DATAVG /dev/sdb{1,2,3}

# 或者先创建 VG 再追加 PV
vgcreate DATAVG /dev/sdb1
vgextend DATAVG /dev/sdb2
vgextend DATAVG /dev/sdb2

# 查看 VG
vgscan
vgdisplay
```
