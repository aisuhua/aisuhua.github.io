# 常见问题

## 安装和升级

### MCP 自动更新并触发节点重启

官方建议 MCP 应该保持开启状态。因为从 4.7.4 版本开始，api-server 证书自动轮转不会再触发节点重启，而关闭自动更新则会导致证书无法正常更新。

执行以下命令，开启 MCP 自动更新

```sh
oc patch --type merge machineconfigpool/master -p '{"spec":{"paused":false}}'
oc patch --type merge machineconfigpool/worker -p '{"spec":{"paused":false}}'
```

- [Understand CA cert auto renewal in Red Hat OpenShift 4](https://access.redhat.com/articles/5651701)
- [Disabling the Machine Config Operator from automatically rebooting by using the console](https://docs.openshift.com/container-platform/4.10/support/troubleshooting/troubleshooting-operator-issues.html#troubleshooting-disabling-autoreboot-mco-console_troubleshooting-operator-issues)

### CoreOS 重启后 hostname 不对

在添加 worker 节点时，虽然使用 `hostnamectl set-hostname` 设置了 hostname，但重启后主机名变成了 localhost。

可以在 ignition 文件里添加主机名解决该问题

```sh hl_lines="23-33"
$ cat worker.ign | jq . > worker1.ocp1.example.com.ign
$ cat worker1.ocp1.example.com.ign
{
  "ignition": {
    "config": {
      "merge": [
        {
          "source": "https://api-int.test.example.com:22623/config/worker"
        }
      ]
    },
    "security": {
      "tls": {
        "certificateAuthorities": [
          {
            "source": "data:text/plain;charset=utf-8;base64,LS0tLS1CR...."
          }
        ]
      }
    },
    "version": "3.1.0"
  },
  "storage": {
    "files": [
      {
        "path": "/etc/hostname",
        "contents": {
          "source": "data:,worker1.ocp1.example.com"
        },
        "mode": 420
      }
    ]
  }
}
```

- [Hostname can not persist when installing RHCOS](https://bugzilla.redhat.com/show_bug.cgi?id=1905986)
- [How to configure persistent hostname when creating RHCOS in OpenShift 4.6 or later?](https://access.redhat.com/solutions/5680251)

### the cluster operator image-registry is degraded

升级无法正常进行，并长时间停留在以下状态

```sh
$ oc get clusterversion -o wide
NAME      VERSION                                   AVAILABLE   PROGRESSING   SINCE   STATUS
version   4.5.0-0.nightly-s390x-2020-06-29-163732   True        False         15h     Error while reconciling 4.5.0-0.nightly-s390x-2020-06-29-163732: the cluster operator image-registry is degraded
```

查看 co 状态

```sh
$ oc describe co image-registry
ImagePrunerDegraded: Job has reached the specified backoff limit
```

解决方法

```sh
oc patch imagepruner.imageregistry/cluster --patch '{"spec":{"suspend":true}}' --type=merge
oc -n openshift-image-registry delete jobs --all
```

- [ImagePrunerDegraded error stalling upgrade](https://access.redhat.com/solutions/5370391)
- [OpenShift v4.x - ImagePrunerDegraded: Job has reached the specified backoff limit](https://gist.github.com/aisuhua/c8e4acbf2d2b1061758ef5ecef5bc0e7)

## Pod

### no space left on device

Pod 无法正常启动，一直处于 ContainerCreating 状态，查看事件发现报 `no space left on device` 错误

```sh
$ oc describe pods mysql8.0.28-nacos3-67965c8f4-6r4st
Events:
  Type     Reason       Age   From               Message
  ----     ------       ----  ----               -------
  Normal   Scheduled    79s   default-scheduler  Successfully assigned zfqs/mysql8.0.28-nacos3-67965c8f4-6r4st to worker8.dev3.example.com
  Warning  FailedMount  79s   kubelet            MountVolume.SetUp failed for volume "kube-api-access-dp55p" : write /var/lib/kubelet/pods/eda464b0-1376-4edb-b0ea-c495f18bbb9e/volumes/kubernetes.io~projected/kube-api-access-dp55p/..2023_05_29_08_16_36.1470493620/ca.crt: no space left on device
  Warning  FailedMount  78s   kubelet            MountVolume.SetUp failed for volume "kube-api-access-dp55p" : write /var/lib/kubelet/pods/eda464b0-1376-4edb-b0ea-c495f18bbb9e/volumes/kubernetes.io~projected/kube-api-access-dp55p/..2023_05_29_08_16_37.1796074709/service-ca.crt: no space left on device
```

发现是 `limit.memory` 和 `request.memory` 的单位写错了

```yaml
resources:
  requests:
    memory: 256m
    cpu: 100m
  limits:
    memory: 512m
    cpu: 100m
```

将 memory 的单位改成 `Mi` 即可

```yaml
resources:
  requests:
    memory: 256Mi
    cpu: 100m
  limits:
    memory: 512Mi
    cpu: 100m
```

- https://github.com/orgs/strimzi/discussions/6399#discussioncomment-2224453
