# 刻录光盘

## 执行包含 ks 的镜像

```sh
# 查看 iso 块设备 ID
# blkid rhel-server-7.9-x86_64-dvd.iso 
rhel-server-7.9-x86_64-dvd.iso: UUID="2020-09-17-19-35-15-00" LABEL="RHEL-7.9 Server.x86_64" TYPE="iso9660" PTTYPE="dos" 
# 也可以直接查看 iso 镜像的 grup.cfg 文件
# 如：RHEL-8-3-0-BaseOS-x86_64
linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=RHEL-8-3-0-BaseOS-x86_64 quiet inst.ks=cdrom:/ks.cfg

# RHEL7
mkdir /mnt/iso
mount rhel-server-7.9-x86_64-dvd.iso /mnt/iso
cp -r /mnt/iso /tmp/rhel79
chmod -R u+w /tmp/rhel79
cp /opt/rhel79.cfg ks.cfg
cd /tmp/rhel79

# 追加 inst.ks=cdrom:/ks.cfg
vim EFI/BOOT/grub.cfg 
vim isolinux/isolinux.cfg 

# 安装制作 iso 的软件
yum install -y genisoimage isomd5sum syslinux

# 开始制作
mkisofs -o /opt/rhel79test.iso -b isolinux/isolinux.bin -J -R -l -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -graft-points -joliet-long -V "RHEL-7.9 Server.x86_64" .
isohybrid --uefi /opt/rhel79test.iso 
implantisomd5 /opt/rhel79test.iso 

# RHEL8
mkisofs -o /opt/rhel83test.iso -b isolinux/isolinux.bin -J -R -l -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -graft-points -joliet-long -V "RHEL-8-3-0-BaseOS-x86_64" .
isohybrid --uefi /opt/rhel83test.iso
implantisomd5 /opt/rhel83
```

## dd

```sh
dd if=rhcos-4.8.14-x86_64-live.x86_64.iso of=<dev/sdx> status=progress
```

## Ventoy

初始化 U 盘

```sh
wget https://github.com/ventoy/Ventoy/releases/download/v1.0.91/ventoy-1.0.91-linux.tar.gz
tar -zxvf ventoy-1.0.91-linux.tar.gz
cd ventoy-1.0.91
sudo sh Ventoy2Disk.sh -i /dev/sdX
```

将 iso 文件拷贝到 U 盘

```sh
cp Win10_22H2_Chinese_Simplified_x64v1.iso /path/to/Ventory
```

插入 U 盘后，进入 BIOS，关闭 Secure Boot 并设置成从 U 盘启动。

!!! note

    必须关闭 Secure Boot 功能，否则会出现 `Verification failed: (0x1A) Security Violation` 报错。

## 参考

- https://www.ventoy.net/cn/doc_start.html#doc_linux_cli
- https://askubuntu.com/a/1456906
- https://github.com/pbatard/rufus
- [How to create a modified Red Hat Enterprise Linux ISO with kickstart file or modified installation media?](https://access.redhat.com/solutions/60959)
