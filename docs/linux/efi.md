# EFI

## 学习心得

1. 有 BIOS 和 UEFI 两种固件，其中部分 UEFI 固件可以 BISO 兼容模式引导操作系统；
2. BIOS/MBR/MS-DOS 分区表和 UEFI/GPT 分区表是固定的组合；
3. BIOS 做完 POST 硬件设备自检后，会逐个检查每个硬件设备的 MBR 区，直到找到第一个启动装载程序，并加载到内存执行。

## 创建一个 UEFI ISO 镜像

```sh
sudo apt install -y grub-efi-amd64-bin mtools xorriso mkisofs
 
mkdir -p iso/boot/grub
mkdir -p iso/EFI/BOOT
 
cp /path/to/initrd.img iso/boot/initrd.img
cp /path/to/vmlinuz iso/boot/vmlinuz
 
cat <<EOF> iso/boot/grub/grub.cfg
set timeout=0
set root=(cd0)
set prefix=(memdisk)/boot/grub
 
menuentry 'Linux' {
   echo 'Loading kernel...'
   linux /boot/vmlinuz console=tty0 rw
   echo "Loading initrd..."
   initrd /boot/initrd.img
   echo "Booting..."
}
EOF
 
grub-mkstandalone -o iso/EFI/BOOT/BOOTX64.EFI -O x86_64-efi "boot/grub/grub.cfg=iso/boot/grub/grub.cfg"
dd if=/dev/zero of=iso/EFI/BOOT/efiboot.img bs=1M count=10
mkfs.msdos -F 12 -n 'EFIBOOTISO' iso/EFI/BOOT/efiboot.img
mmd -i iso/EFI/BOOT/efiboot.img ::EFI
mmd -i iso/EFI/BOOT/efiboot.img ::EFI/BOOT
mcopy -i iso/EFI/BOOT/efiboot.img iso/EFI/BOOT/BOOTX64.EFI ::EFI/BOOT/BOOTX64.EFI
 
xorriso -as mkisofs -V 'EFI_ISO_BOOT' -e EFI/BOOT/efiboot.img -no-emul-boot -o /tmp/efi-boot.iso iso/
```

## Links

- [An introduction to the Linux boot and startup processes](https://opensource.com/article/17/2/linux-boot-and-startup)
- [Guide to the Boot Process of a Linux System](https://www.baeldung.com/linux/boot-process)
- [（译）UEFI 启动：实际工作原理 ](https://www.cnblogs.com/mahocon/p/5691348.html)
- [UEFI boot: how does that actually work, then?](https://www.happyassassin.net/posts/2014/01/25/uefi-boot-how-does-that-actually-work-then/)
- https://github.com/linuxkit/linuxkit/blob/master/tools/mkimage-iso-efi/make-efi
- [Create bootable UEFI ISO image](http://www.panticz.de/create-uefi-iso)
