# 安装

## 名词解释

```sh
IIM IBM Installation Manager 安装和配置 WAS 需要用到，跟运行时没有关系 
WAS IBM WebSphere Application Server
FP FixPack
IHS IBM HTTP Server
Dmgr Deployment Manager
NodeAgent 安装在每个受管理节点（managed node）上，Application Server 也安装在节点上。
```

## 安装步骤

```sh
# 介质存放目录
mkdir /opt/IBM/soft/iim -p
mkdir /opt/IBM/soft/was -p

# 介质位置
# tree /opt/IBM/soft
.
├── iim
│   └── agent.installer.linux.gtk.x86_64_1.8.5000.20160506_1125.zip
└── was
    ├── WAS_ND_V8.5.5_1_OF_3.zip
    ├── WAS_ND_V8.5.5_2_OF_3.zip
    └── WAS_ND_V8.5.5_3_OF_3.zip

# 安装目录
mkdir /opt/IBM/InstallationManager -p
mkdir /opt/IBM/WebSphere/AppServer -p
mkdir /wasdump

# 创建运行用户
useradd wasadmin
chown -R wasadmin:wasadmin /opt/IBM
sudo su - wasadmin

# !! 节点间是通过主机名进行通许，必须支持
# 如通过配置 /etc/hosts
10.0.0.24 dmgr
10.0.0.13 wasnode01
```

## 安装 WAS

所有节点都需安装 WAS，包括 DMGR 节点和 managed node。

```sh
# 安装 IIM
/opt/IBM/soft/iim/userinstc -acceptLicense -installationDirectory /opt/IBM/InstallationManager -log ./log.xml -silent

# 查看版本信息
/opt/IBM/InstallationManager/eclipse/tools/imcl listAvailablePackages -repositories /opt/IBM/soft/was/repository.config -features -long

# 安装 WAS
/opt/IBM/InstallationManager/eclipse/tools/imcl install com.ibm.websphere.ND.v85_8.5.5000.20130514_1044 -repositories /opt/IBM/soft/was/repository.config -installationDirectory /opt/IBM/WebSphere/AppServer -acceptLicense

# 查看版本
# 缺依赖时需执行 yum install libnsl
/opt/IBM/WebSphere/AppServer/bin/versionInfo.sh
```

## 安装 DMGR

仅需在 DMGR 节点上执行

```
# 安装 DMGR
yum install psmisc
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh \
  -create \
  -profileName Dmgr01 \
  -profilePath /opt/IBM/WebSphere/AppServer/profiles/Dmgr01 \
  -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/management \
  -nodeName DmgrNode01 \
  -personalCertValidityPeriod 10 \
  -hostName dmgr

# 如安装失败，可执行以下命令清理
# /opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -delete -profileName Dmgr01
# rm -rf /opt/IBM/WebSphere/AppServer/profiles/Dmgr01

# 启动 DMGR（在管理节点上执行）
/opt/IBM/WebSphere/AppServer/profiles/Dmgr01/bin/startManager.sh
```

## 安装 NodeAgent

仅需在 NodeAgent 节点上执行

```sh
# 创建 NodeAgents
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh \
  -create \
  -profileName AppSrv01 \
  -profilePath /opt/IBM/WebSphere/AppServer/profiles/AppSrv01 \
  -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/managed \
  -nodeName AppSrv01 \
  -personalCertValidityPeriod 10 \
  -hostName wasnode01

/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh \
  -create \
  -profileName AppSrv02 \
  -profilePath /opt/IBM/WebSphere/AppServer/profiles/AppSrv02 \
  -templatePath /opt/IBM/WebSphere/AppServer/profileTemplates/managed \
  -nodeName AppSrv02 \
  -personalCertValidityPeriod 10 \
  -hostName wasnode01

# 如安装失败，可执行以下命令清理
# /opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -delete -profileName AppSrv01
# rm -rf /opt/IBM/WebSphere/AppServer/profiles/AppSrv01

# 向 DMGR 节点注册本节点
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/addNode.sh dmgr 8879

# addNode 就会自动 NodeAgent 或者手工启动（在受管节点上执行）
# /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startNode.sh
```

## 测试验证

浏览器打开 http://{DMGR_IP}:9060/admin 输入任意用户名登录。

## 其他

```sh
# 日志目录
/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs
```

## 参考文献

- [版本信息](https://www.ibm.com/support/pages/recommended-updates-websphere-application-server)
- [Implementing IBM WebSphere Application Server clustering](https://www.ibm.com/docs/en/iis/8.5?topic=clustering-implementing-websphere-application-server)
- [Encountering 'error while loading shared libraries: libnsl.so.1' using a new ITX installation](https://www.ibm.com/support/pages/encountering-error-while-loading-shared-libraries-libnslso1-using-new-itx-installation)
- [Creating profiles in WAS 8559 on CentOS 7](https://serverfault.com/questions/789392/creating-profiles-in-was-8559-on-centos-7)
- [Deleted Profile shows in profile management tool of IBM Websphere](https://stackoverflow.com/questions/24296637/deleted-profile-shows-in-profile-management-tool-of-ibm-websphere)
- [WebSphere Application Server: 概述](https://www.ibm.com/docs/zh/was-nd/9.0.5?topic=90-websphere-application-server-overview)
- [was9安装与was8.5区别](https://www.codenong.com/cs107109370/)
