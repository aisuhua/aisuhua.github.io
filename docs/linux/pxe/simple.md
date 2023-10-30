# 简单的示例

## 安装所需的软件

```sh
sudo apt install isc-dhcp-server tftpd-hpa nginx
```

## 准备操作系统 ISO

```sh
rhel-server-7.9-x86_64-dvd.iso
rhel-8.3-x86_64-dvd.iso
Kylin-Server-10-SP1-Release-Build20-20210518-x86_64.iso
Kylin-Server-10-SP2-x86-Release-Build09-20210524.iso
```

## Kickstart

可以手工安装好操作系统后，从 `/root/anaconda-ks.cfg` 得到，然后按需进行自定义即可。

## 制作镜像源

```sh
# 创建 iso 临时挂在目录
mkdir -p /mnt/{rhel79,rhel83,v10sp1,v10sp2}

# 将镜像挂载到目录
mount rhel-server-7.9-x86_64-dvd.iso /mnt/rhel79
mount rhel-8.3-x86_64-dvd.iso /mnt/rhel83
mount Kylin-Server-10-SP1-Release-Build20-20210518-x86_64.iso /mnt/v10sp1
mount Kylin-Server-10-SP2-x86-Release-Build09-20210524.iso /mnt/v10sp2

# 创建镜像文件存放目录
mkdir -p /opt/www/mirror

# 拷贝文件到镜像文件目录
cp -r /mnt/rhel79 /opt/www/mirror/rhel79
cp -r /mnt/rhel83 /opt/www/mirror/rhel83
cp -r /mnt/v10sp1 /opt/www/mirror/v10sp1
cp -r /mnt/v10sp2 /opt/www/mirror/v10sp2
```

## 将 kickstart 文件放到 web 目录

```sh
# 创建存放 kickstart 文件的目录
mkdir -p /opt/www/mirror/ks

# 按需创建 ks 文件
touch /opt/www/mirror/ks/ks.cfg
```

## 配置 Nginx

```nginx
# 配置文件内容
server {
  listen 80;
  root /opt/www/mirror;
  autoindex on;
}


# 验证
curl localhost/ks/ks.cfg
```

## 配置 DHCP

```sh

```




