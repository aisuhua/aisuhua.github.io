# Nginx

```nginx
# HTTPS 证书配置实例
server {
  listen 443 ssl;

  server_name example.com;

  # 服务端证书认证
  ssl_certificate /etc/nginx/certs/example.com.pem;
  ssl_certificate_key /etc/nginx/certs/example.com-key.pem;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_ciphers HIGH:!aNULL:!MD5;

  # 客户端证书认证
  ssl_client_certificate /etc/nginx/certs/ca.pem;
  ssl_verify_client optional;

  location / {
    # 自定义客户端认证失败时的错误信息
    if ($ssl_client_verify != SUCCESS) {
      return 500 ' ';
    }

    default_type text/html;
    return 200 'ok';
  }
}
```

- [巧用 Nginx 快速实现 HTTPS 双向认证](https://blog.csdn.net/easylife206/article/details/107776854)

```sh
# 默认日志格式
log_format combined '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent"';
```

- [Configuring Logging](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/)
