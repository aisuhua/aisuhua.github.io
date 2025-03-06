# 应用常见问题

## 调整 TCP timeout

注意如链路上经过了其他负载均衡器，则 timeout 最大值不能超过它们的阀值。

```sh
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example
  namespace: my-namespace
  annotations:
    haproxy.router.openshift.io/timeout: 600s
spec:
  tls:
    - hosts:
        - example.com
      secretName: https-tls-secret
  rules:
    - host: example.com
      http:
        paths:
          - path: /testpath
            pathType: Prefix
            backend:
              service:
                name: test
                port:
                  number: 80
```

- [Configuring route timeouts](https://docs.openshift.com/container-platform/4.10/networking/routes/route-configuration.html#nw-configuring-route-timeouts_route-configuration)
