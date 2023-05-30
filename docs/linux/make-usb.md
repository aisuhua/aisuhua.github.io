# 刻录光盘

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

## 参考文献

- https://www.ventoy.net/cn/doc_start.html#doc_linux_cli
- https://askubuntu.com/a/1456906
- https://github.com/pbatard/rufus
