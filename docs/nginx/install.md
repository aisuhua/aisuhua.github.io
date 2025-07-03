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
```

- https://github.com/chobits/ngx_http_proxy_connect_module
- https://nginx.org/download
