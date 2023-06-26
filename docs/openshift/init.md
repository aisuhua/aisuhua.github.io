# 初始化

## 新用户不能创建项目

```sh
oc patch clusterrolebinding.rbac self-provisioners -p '{"subjects": null}'
oc patch clusterrolebinding.rbac self-provisioners -p '{"metadata": {"annotations": {"rbac.authorization.kubernetes.io/autoupdate": "false" }}}'
```

- [Disabling project self-provisioning](https://docs.openshift.com/container-platform/4.10/applications/projects/configuring-project-creation.html#disabling-project-self-provisioning_configuring-project-creation)

