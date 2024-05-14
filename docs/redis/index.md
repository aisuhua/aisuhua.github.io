# redis

```sh
# Error jemalloc/jemalloc.h: No such file or directory when making Redis
[redis-6.2.0]$ make distclean

# 安装
wget https://download.redis.io/releases/redis-7.2.4.tar.gz
tar -zxvf redis-7.2.4.tar.gz
cd redis-7.2.4
make
make install PREFIX=/opt/www/redis/redis-7.2.4

# 创建集群
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 \
127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 \
--cluster-replicas 1

# 查看集群状态
redis-cli -a PASSWORD 
```
