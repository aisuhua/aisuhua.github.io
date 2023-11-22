# 安装

```sh
/opt/IBM/soft/iim/userinstc -acceptLicense -installationDirectory /opt/IBM/InstallationManager -log ./log.xml -silent
/opt/IBM/InstallationManager/eclipse/tools/imcl listAvailablePackages -repositories /opt/IBM/soft/was/repository.config -features -long

/opt/IBM/InstallationManager/eclipse/tools/imcl install com.ibm.websphere.ND.v85_8.5.5000.20130514_1044 -repositories /opt/IBM/soft/was/repository.config -installationDirectory /opt/IBM/WebSphere/AppServer -acceptLicense

/usr/IBM/WebSphere/AppServer/bin/versionInfo.sh
```

 




