# MCP 自动更新

官方建议 MCP 应该保持开启状态。因为从 4.7.4 版本开始，api-server 证书轮转不会再触发节点重启，而关闭自动更新则会导致证书无法正常更新。

执行以下命令，开启 MCP 自动更新 

```sh
oc patch --type merge machineconfigpool/master -p '{"spec":{"paused":false}}'
oc patch --type merge machineconfigpool/worker -p '{"spec":{"paused":false}}'
```

## 参考

1. [Understand CA cert auto renewal in Red Hat OpenShift 4](https://access.redhat.com/articles/5651701)
2. [Disabling the Machine Config Operator from automatically rebooting by using the console](https://docs.openshift.com/container-platform/4.10/support/troubleshooting/troubleshooting-operator-issues.html#troubleshooting-disabling-autoreboot-mco-console_troubleshooting-operator-issues)
