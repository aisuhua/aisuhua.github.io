# OpenShift

## Pod

```sh
# 强制删除 Pod
kubectl delete pod --grace-period=0 --force --namespace <NAMESPACE> <PODNAME>

# 删除当前命名空间下所有 Terminating 的 Pod
for p in $(kubectl get pods | grep Terminating | awk '{print $1}'); do kubectl delete pod $p --grace-period=0 --force;done

# 删除集群里所有 Terminating 的 Pod
kubectl get pods --all-namespaces | awk '{if ($4=="Terminating") print "oc delete pod " $2 " -n " $1 " --force --grace-period=0 ";}' | sh
```
