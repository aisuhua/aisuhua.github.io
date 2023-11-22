# 安装

```sh
/opt/IBM/soft/iim/userinstc -acceptLicense -installationDirectory /opt/IBM/InstallationManager -log ./log.xml -silent
/opt/IBM/InstallationManager/eclipse/tools/imcl listAvailablePackages -repositories /opt/IBM/soft/was/repository.config -features -long

/opt/IBM/InstallationManager/eclipse/tools/imcl install com.ibm.websphere.ND.v85_8.5.5000.20130514_1044 -repositories /opt/IBM/soft/was/repository.config -installationDirectory /opt/IBM/WebSphere/AppServer -acceptLicense

yum install libnsl
/opt/IBM/WebSphere/AppServer/bin/versionInfo.sh

/opt/IBM/InstallationManager/eclipse/tools/imcllistAvailablePackages -repositories /opt/IBM/soft/ihs/repository.config -features -long
```

## 参考文献

- [Encountering 'error while loading shared libraries: libnsl.so.1' using a new ITX installation](https://www.ibm.com/support/pages/encountering-error-while-loading-shared-libraries-libnslso1-using-new-itx-installation)






