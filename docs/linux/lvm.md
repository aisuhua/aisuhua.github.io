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
echo '/dev/mapper/ROOTVG-lv_data /data xfs defaults 0 0' >> /etc/fstab
```

## 放大 LV 容量

```sh
fdisk /dev/sdc
pvcreate /dev/sdc1
vgextend DATAVG /dev/sdc1
lvresize -l +100%free /dev/DATAVG/lv_data
xfs_growfs /dev/DATAVG/lv_data
```




















