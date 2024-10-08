# 常见问题

```sh
# 当 Kylin 等操作系统在 PXE 安装时出现奇怪的问题时
vmware 选择 Centos 7，并将内存设置为 4 GB 左右，太大也启动不来
注意 vmware 硬盘的类型，scsi 类型才能在 kickstart 使用 /dev/sda 来划分分区
vmware 选择的操作系统类型，会关系到硬盘类型，以及操作系统位数等，对 PXE 安装会有影响，注意选择相近的。
```

1. [记一次ARM服务器(鲲鹏920)的PXE批量装机遇到的坑](https://zhuanlan.zhihu.com/p/455658471)
2. [Configuring active/backup bonded interfaces on CentOS Linux hosts](https://prefetch.net/blog/2009/04/11/configuring-activebackup-bonded-interfaces-on-centos-linux-hosts/)
3. [Logging %pre during kickstart - logfile doesn't exist after boot](https://unix.stackexchange.com/questions/78388/logging-pre-during-kickstart-logfile-doesnt-exist-after-boot)
4. [Logging all the commands executed during a kickstart installation to file and screen](https://serverfault.com/questions/256305/logging-all-the-commands-executed-during-a-kickstart-installation-to-file-and-sc)
5. [RHEL – How to Identify Logical and Physical Network Interface Names While Installing the OS](https://docs.oracle.com/cd/E19902-01/html/821-1367/gjtlm.html)
6. [nmcli - command line means to delete all wifi / wlan0 connections](https://unix.stackexchange.com/questions/665360/nmcli-command-line-means-to-delete-all-wifi-wlan0-connections)
7. [zhangguanzhang/Installer](https://github.com/zhangguanzhang/Installer)
8. [How to execute script after system reboot by using kickstart](https://stackoverflow.com/questions/31023115/how-to-execute-script-after-system-reboot-by-using-kickstart)
9. [Have a kickstart file run an independent script file from its %post section](https://serverfault.com/questions/978639/have-a-kickstart-file-run-an-independent-script-file-from-its-post-section)
10. [How to set hostname using hostnamectl during kickstart in Red Hat Enterprise Linux 7?](https://access.redhat.com/solutions/1452273)
11. [How to set hostname during kickstart installation (CentOS/RHEL 5,6,7)](https://www.thegeeksearch.com/how-to-set-hostname-during-kickstart-installation-centos-rhel-567/)
12. [CentOS 7 kickstart file set hostname with hostnamectl](https://stackoverflow.com/questions/69921541/centos-7-kickstart-file-set-hostname-with-hostnamectl)
13. [kickstart-tests](https://github.com/rhinstaller/kickstart-tests)
14. [Noppy/KickStart](https://github.com/Noppy/KickStart)
15. [Why does kickstart installation of Red Hat Enterprise Linux fail with error "Specified nonexistent disk sda in partition command" ?](https://access.redhat.com/solutions/47021)
16. [Netboot - How to set a static IP](https://unix.stackexchange.com/questions/37394/netboot-how-to-set-a-static-ip)
