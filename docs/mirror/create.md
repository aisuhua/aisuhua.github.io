# 制作源

## yum 源

```sh
# 初始化 yum 源
createrepo /opt/rpms

# 更新 yum 源
createrepo --update /opt/rpms

# repo 文件
[customrepo]
name=CustomRepository
baseurl=file:///opt/rpms
enabled=1
gpgcheck=0
```

## 参考文献

- [How to Create Your Own Repositories for Packages](https://www.percona.com/blog/how-to-create-your-own-repositories-for-packages/#)
- [Need to set up yum repository for locally-mounted DVD on Red Hat Enterprise Linux 7](https://access.redhat.com/solutions/1355683)
- [How To Install createrepo on Ubuntu 18.04](https://installati.one/install-createrepo-ubuntu-18-04/#google_vignette)
