# 准备安装介质

## 需要的介质

1. OpenShift 安装脚本 [openshift-install-linux-4.8.36.tar.gz](https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.8.36/openshift-install-linux-4.8.36.tar.gz)
2. OpenShift oc 客户端 [openshift-client-linux-4.8.36.tar.gz](https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.8.36/openshift-client-linux-4.8.36.tar.gz) 
3. CoreOS 安装光盘 [rhcos-4.8.14-x86_64-live.x86_64.iso](https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/4.8/latest/rhcos-4.8.14-x86_64-live.x86_64.iso)
4. machine configs 生成工具 [butane](https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/butane/latest/butane)
5. OpenShift 安装镜像 [4.8.36_releases](#_3)
6. 一个 4G+ 的 U 盘，用于刻录安装光盘

以上介质，除了下载 OpenShift 安装镜像需要使用订阅号外，其他介质都可以在公网直接下载。

## 下载安装镜像

以下步骤将下载 OpenShift 安装镜像到本地磁盘，镜像比较大，请预留至少 20GB 空间。

!!! note
     
    因为需要从红帽官网下载镜像，如果用个人电脑下载，速度会比较慢，而且经常中断，
    所以建议使用国内的云服务器（例如：阿里云、腾讯云等）进行下载。

#### 安装 oc 客户端

```sh
tar -zxvf openshift-client-linux-4.8.36.tar.gz -C /usr/local/bin oc kubectl
```

#### 获取 pull-secert.txt

打开 https://console.redhat.com/openshift/install/pull-secret 页面，**使用订阅号登录后下载**。

#### 将镜像同步到本地

```sh
oc adm -a pull-secret.txt release mirror 4.8.36 --to-dir ./4.8.36_release
```

#### 打包镜像文件夹

```sh
tar -cvf 4.8.36_release.tar 4.8.36_release
```

## 制作启动盘

```sh
dd if=rhcos-4.8.14-x86_64-live.x86_64.iso of=<dev/sdx> status=progress
```

!!! note

    CoreOS 安装镜像的版本不能高过现在正在安装的 OpenShift 的版本。
