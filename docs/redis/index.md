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

# 端口和密码
redis-cli -p 7000 -a PASSWORD

# 创建集群
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 \
127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 \
--cluster-replicas 1

# 查看集群状态
redis-cli -a PASSWORD 127.0.0.1:7000
> cluster nodes
> cluster info

# 作为 master 节点加入集群
redis-cli --cluster add-node 127.0.0.1:7006 127.0.0.1:7000

# 作为 slave 节点加入集群
redis-cli --cluster add-node 127.0.0.1:7006 127.0.0.1:7000 --cluster-slave

# 从集群中删除节点
redis-cli --cluster del-node 127.0.0.1:7000 `<node-id>`

# however in order to remove a master node it must be empty.
# 假设 127.0.0.1:7003 是待移除的 master 节点，要先转移 slot 到其他节点
redis-cli --cluster reshard 127.0.0.1:7003

# 节点主动退出集群
redis-cli 127.0.0.1:7003
> flushall
> cluster reset
> exit

# 或者清理配置和数据文件
rm -rf data/*
rm -rf conf/nodes.conf
rm -rf dump.rdb

# 报错 [ERR] Not all 16384 slots are covered by nodes.
redis-cli --cluster --fix 127.0.0.1:7000
```

## Links

- [Why does Redis Server not allow me to connect to a node?](https://stackoverflow.com/questions/37206993/why-does-redis-server-not-allow-me-to-connect-to-a-nodes)
- [Hash Slot Resharding and Rebalancing for Redis Cluster](https://severalnines.com/blog/hash-slot-resharding-and-rebalancing-redis-cluster/)
- [Redis搭建集群时报错[ERR] Not all 16384 slots are covered by nodes.](https://blog.csdn.net/qingbo_2920249511/article/details/121949083)
- [4.1 Exercise - Creating a Redis Cluster](https://redis.io/learn/operate/redis-at-scale/scalability/exercise-1)
