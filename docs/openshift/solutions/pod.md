# Pod

常见问题

## write /var/lib/kubelet/pods/xxx/volumes/kubernetes.io~projected/kube-api-access-dp55p/xxx/ca.crt: no space left on device

## 环境

- OpenShift 4.10.50

## 问题

- Pod 无法正常启动，一直处于 ContainerCreating 状态

## 重现

```sh
$ oc describe pods pod-name
Events:
  Type     Reason       Age   From               Message
  ----     ------       ----  ----               -------
  Normal   Scheduled    79s   default-scheduler  Successfully assigned zfqs/mysql8.0.28-nacos3-67965c8f4-6r4st to worker8.dev3.example.com
  Warning  FailedMount  79s   kubelet            MountVolume.SetUp failed for volume "kube-api-access-dp55p" : write /var/lib/kubelet/pods/eda464b0-1376-4edb-b0ea-c495f18bbb9e/volumes/kubernetes.io~projected/kube-api-access-dp55p/..2023_05_29_08_16_36.1470493620/ca.crt: no space left on device
  Warning  FailedMount  78s   kubelet            MountVolume.SetUp failed for volume "kube-api-access-dp55p" : write /var/lib/kubelet/pods/eda464b0-1376-4edb-b0ea-c495f18bbb9e/volumes/kubernetes.io~projected/kube-api-access-dp55p/..2023_05_29_08_16_37.1796074709/service-ca.crt: no space left on device
```

## 主要原因

资源限额的单位写错了

## 解决方法 

将 `Mi` 写成了 `m`

```yaml
resources:
  requests:
    memory: 256m
    cpu: 100m
  limits:
    memory: 512m
    cpu: 100m
```

