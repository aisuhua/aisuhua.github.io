# 安装

本文记录了在离线环境下安装 OpenShift 4.8.36 的完整步骤。

## 前提

要完成安装 OpenShift，必须要有 DNS、Chrony、负载均衡器（HAProxy、Nginx 等）、镜像仓库（Harbor）。

1. [CoreDNS](../../coredns/index.md)

## 相关资源

- 下载安装文件 https://mirror.openshift.com/pub/openshift-v4/
- 查看最新发行版 https://openshift-release.apps.ci.l2s4.p1.openshiftapps.com/
- 查看升级路径 https://access.redhat.com/labs/ocpupgradegraph/update_path
- 查看不同版本之间的变化 https://openshift-release.apps.ci.l2s4.p1.openshiftapps.com/releasestream/4-stable/release/4.8.56?from=4.8.36
- [Red Hat OpenShift Container Platform Life Cycle Policy] (https://access.redhat.com/support/policy/updates/openshift#dates)
