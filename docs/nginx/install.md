# Nginx

```sh
wget https://nginx.org/download/nginx-1.27.1.tar.gz
tar -zxvf nginx-1.27.1.tar.gz 
git clone https://github.com/chobits/ngx_http_proxy_connect_module.git
cd nginx-1.27.1/
patch -p1 < ../ngx_http_proxy_connect_module/patch/proxy_connect_rewrite_102101.patch
yum install -y pcre-devel zlib-devel
./configure --add-module=../ngx_http_proxy_connect_module --with-stream
make && make install
export PATH=$PATH:/usr/local/nginx/sbin

127.0.0.*;172.31.96.*;10.20.25.*;10.0.4.*;127.0.0.1

server {
    listen                         31280;

    # dns resolver used by forward proxying
    resolver                       114.114.114.114;

    # forward proxy for CONNECT requests
    proxy_connect;
    proxy_connect_allow            all;
    proxy_connect_connect_timeout  300s;
    proxy_connect_data_timeout     300s;

    # defined by yourself for non-CONNECT requests
    # Example: reverse proxy for non-CONNECT requests
    location / {
        proxy_pass http://$host;
        proxy_set_header Host $host;
    }
}
```

- https://github.com/chobits/ngx_http_proxy_connect_module
- https://nginx.org/download



国家金融监督管理总局消费投诉处理管理系统
easyconnnect 走反向代理 stream 代理 42.201.65.239:443 软件配置
消费者保护服务平台 走总行代理 在软件层面
