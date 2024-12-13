# LVM

## 添加磁盘

```
# 不重启 VM，将新磁盘加到操作系统
echo "- - -" | tee /sys/class/scsi_host/host*/scan

# 查看块设备
lsblk
```

## 划分分区

```sh
# 分区类型选择 Linux LVM 即 8e
fdisk /dev/sdb
```

## 创建 PV

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

## 创建 VG

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

## 划分 LV

```sh
# 根据 PE 数量创建，先 vgdisplay 查看剩余可用 PE
lvcreate -l 6397 -n lv_data DATAVG

# 或者根据大小来创建
lvcreate -L +25G -n lv_data DATAVG
# 或者使用所有剩余容量
lvcreate -l +100%free -n lv_data DATAVG

选项与参数：
-L  ：后面接容量，容量的单位可以是 M,G,T 等，要注意的是，最小单位为 PE，
      因此这个数量必须要是 PE 的倍数，若不相符，系统会自行计算最相近的容量。
-l  ：后面可以接 PE 的『个数』，而不是数量。若要这么做，得要自行计算 PE 数。
-n  ：后面接的就是 LV 的名称啦！

# 查看 LV
lvscan
lvdisplay
```

## 创建文件系统

```sh
# 格式化文件系统
mkfs.xfs /dev/DATAVG/lv_data 

# 挂载使用
mkdir /data
mount /dev/DATAVG/lv_data /data

# 配置成开机自动挂载
echo '/dev/mapper/DATAVG-lv_data /data xfs defaults 0 0' >> /etc/fstab
```

## 放大 LV 容量

```sh
fdisk /dev/sdc
pvcreate /dev/sdc1
vgextend DATAVG /dev/sdc1
lvresize -l +100%free /dev/DATAVG/lv_data
# lvresize -l +1279 /dev/DATAVG/lv_data
# lvresize -L +10G /dev/DATAVG/lv_data
xfs_growfs /dev/DATAVG/lv_data
# ext4 使用下面的命令
# resize2fs /dev/DATAVG/lv_data
```

## 删除 lv、vg、pv

```sh
# unmount the partition
umount /data
# Disable LVM
lvchange -an /dev/DATAVG/lv_data
# Delete LVM volume
lvremove /dev/DATAVG/lv_data
# Remove volume group
vgremove DATAVG
# Delete physical volumes used for volume group “vg”
pvremove /dev/sdb1
```

## swap 扩容

```sh
swapoff /dev/ROOTVG/lv_swap
lvresize -l +100%free /dev/ROOTVG/lv_swap
mkswap /dev/ROOTVG/lv_swap
swapon /dev/ROOTVG/lv_swap
```

- [How can I modify the size of swap with LVM partitions?](https://askubuntu.com/questions/226520/how-can-i-modify-the-size-of-swap-with-lvm-partitions)

## Links

- [逻辑卷轴管理员 (Logical Volume Manager)](http://cn.linux.vbird.org/linux_basic/0420quota.php#lvm)
- [14.2：邏輯捲軸管理員 (Logical Volume Manager)](https://linux.vbird.org/linux_basic_train/centos8/unit14.php#14.2)
- [Rescan the SCSI Bus to Add a SCSI Device Without rebooting the VM](https://www.cyberciti.biz/tips/vmware-add-a-new-hard-disk-without-rebooting-guest.html)
- [Extending a logical volume in a virtual machine running Red Hat or Cent OS](https://kb.vmware.com/s/article/1006371)
- [Linux Quick Tip: How to Delete or Remove LVM volumes](https://faun.pub/linux-quick-tip-how-to-delete-or-remove-lvm-volumes-7df4447102af)
















