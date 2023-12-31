# CentOS 5

```sh
[base]
name=CentOS-$releasever - Base
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/5.11/os/$basearch/
	https://mirrors.aliyun.com/centos-vault/5.11/os/$basearch/
enabled=1
gpgcheck=0

[updates]
name=CentOS-$releasever - Updates
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/5.11/updates/$basearch/
	https://mirrors.aliyun.com/centos-vault/5.11/updates/$basearch/
enabled=1
gpgcheck=0

[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/5.11/extras/$basearch/
	https://mirrors.aliyun.com/centos-vault/5.11/extras/$basearch/
enabled=1
gpgcheck=0

[centosplus]
name=CentOS-$releasever - Plus
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/5.11/centosplus/$basearch/
	https://mirrors.aliyun.com/centos-vault/5.11/extras/$basearch/
enabled=1
gpgcheck=0
```
