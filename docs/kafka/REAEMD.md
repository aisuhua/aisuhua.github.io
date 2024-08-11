# Kafka

```sh
./bin/kafka-topics.sh --bootstrap-server 172.31.96.149:9092 --create --topic hello
./bin/kafka-topics.sh --bootstrap-server 172.31.96.149:9092 --list

./bin/kafka-topics.sh --bootstrap-server 172.31.96.149:9092 --describe --topic hello

./bin/kafka-console-producer.sh --bootstrap-server 172.31.96.149:9092 --topic hello
./bin/kafka-console-consumer.sh --bootstrap-server 172.31.96.149:9092 --topic hello --from-beginning

查看集群状态
./bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.96.149:9092 describe --status
./bin/kafka-broker-api-versions.sh --bootstrap-server 172.31.96.149:9092

# create topic
/opt/kafka/3.8.0/server1/bin/kafka-topics.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --list
/opt/kafka/3.8.0/server1/bin/kafka-topics.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --create --topic hello
/opt/kafka/3.8.0/server1/bin/kafka-topics.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --describe --topic hello 

# product and consume
/opt/kafka/3.8.0/server1/bin/kafka-console-producer.sh --bootstrap-server 172.31.96.149:19093 --producer.config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --topic hello
/opt/kafka/3.8.0/server1/bin/kafka-console-consumer.sh --bootstrap-server 172.31.96.149:19093 --consumer.config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --topic hello --from-beginning

/opt/kafka/3.8.0/server1/bin/kafka-console-producer.sh --bootstrap-server 172.31.96.149:19093,172.31.96.149:19094,172.31.96.149:19095 --producer.config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --topic hello
/opt/kafka/3.8.0/server1/bin/kafka-console-consumer.sh --bootstrap-server 172.31.96.149:19093,172.31.96.149:19094,172.31.96.149:19095 --consumer.config /opt/kafka/3.8.0/server1/config/kraft/admin.conf --topic hello --from-beginning

# version
/opt/kafka/3.8.0/server1/bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/3.8.0/server1/config/kraft/admin.conf describe --status
/opt/kafka/3.8.0/server1/bin/kafka-broker-api-versions.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/3.8.0/server1/config/kraft/admin.conf
/opt/kafka/3.8.0/server1/bin/kafka-broker-api-versions.sh --bootstrap-server 172.31.96.149:19093,172.31.96.149:19094,172.31.96.149:19095 --command-config /opt/kafka/3.8.0/server1/config/kraft/admin.conf

# one time
curl -sL http://192.168.88.61/other/kafka_2.12-3.5.2.tgz -o /opt/kafka_2.12-3.5.2.tgz
tar -xzf /opt/kafka_2.12-3.5.2.tgz -C /opt/

# node1
cp -r /opt/kafka_2.12-3.5.2 /data/kafka_19093
cp /data/kafka_19093/config/kraft/server.properties /data/kafka_19093/config/kraft/server.properties.bak.$(date +%Y%m%d%H%M%S)
sed -i 's/^process.roles=.*/process.roles=broker,controller/' /data/kafka_19093/config/kraft/server.properties
sed -i 's/^controller.quorum.voters=.*/controller.quorum.voters=1@172.31.96.149:29093,2@172.31.96.149:29094,3@172.31.96.149:29095/' /data/kafka_19093/config/kraft/server.properties
sed -i 's/^log.dirs=.*/log.dirs=\/data\/kafka_19093\/logs/' /data/kafka_19093/config/kraft/server.properties

sed -i 's/^node.id=.*/node.id=1/' /data/kafka_19093/config/kraft/server.properties
sed -i 's/^listeners=.*/listeners=PLAINTEXT:\/\/172.31.96.149:19093,CONTROLLER:\/\/172.31.96.149:29093/' /data/kafka_19093/config/kraft/server.properties
sed -i 's/^advertised.listeners=.*/advertised.listeners=PLAINTEXT:\/\/172.31.96.149:19093/' /data/kafka_19093/config/kraft/server.properties
cat /data/kafka_19093/config/kraft/server.properties | grep -Ev '^$|#' | egrep "(process.|node.id|controller.|listeners|log.dir|sadvertised.)"

KAFKA_CLUSTER_ID=asjC792iR3CMelxQGh923A
/data/kafka_19093/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /data/kafka_19093/config/kraft/server.properties

# node2
cp -r /opt/kafka_2.12-3.5.2 /data/kafka_19094
cp /data/kafka_19094/config/kraft/server.properties /data/kafka_19094/config/kraft/server.properties.bak.$(date +%Y%m%d%H%M%S)
sed -i 's/^process.roles=.*/process.roles=broker,controller/' /data/kafka_19094/config/kraft/server.properties
sed -i 's/^controller.quorum.voters=.*/controller.quorum.voters=1@172.31.96.149:29093,2@172.31.96.149:29094,3@172.31.96.149:29095/' /data/kafka_19094/config/kraft/server.properties
sed -i 's/^log.dirs=.*/log.dirs=\/data\/kafka_19094\/logs/' /data/kafka_19094/config/kraft/server.properties

sed -i 's/^node.id=.*/node.id=2/' /data/kafka_19094/config/kraft/server.properties
sed -i 's/^listeners=.*/listeners=PLAINTEXT:\/\/172.31.96.149:19094,CONTROLLER:\/\/172.31.96.149:29094/' /data/kafka_19094/config/kraft/server.properties
sed -i 's/^advertised.listeners=.*/advertised.listeners=PLAINTEXT:\/\/172.31.96.149:19094/' /data/kafka_19094/config/kraft/server.properties
cat /data/kafka_19094/config/kraft/server.properties | grep -Ev '^$|#' | egrep "(process.|node.id|controller.|listeners|log.dir|sadvertised.)"

KAFKA_CLUSTER_ID=asjC792iR3CMelxQGh923A
/data/kafka_19094/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /data/kafka_19094/config/kraft/server.properties

# node2
cp -r /opt/kafka_2.12-3.5.2 /data/kafka_19095
cp /data/kafka_19095/config/kraft/server.properties /data/kafka_19095/config/kraft/server.properties.bak.$(date +%Y%m%d%H%M%S)
sed -i 's/^process.roles=.*/process.roles=broker,controller/' /data/kafka_19095/config/kraft/server.properties
sed -i 's/^controller.quorum.voters=.*/controller.quorum.voters=1@172.31.96.149:29093,2@172.31.96.149:29094,3@172.31.96.149:29095/' /data/kafka_19095/config/kraft/server.properties
sed -i 's/^log.dirs=.*/log.dirs=\/data\/kafka_19095\/logs/' /data/kafka_19095/config/kraft/server.properties

sed -i 's/^node.id=.*/node.id=3/' /data/kafka_19095/config/kraft/server.properties
sed -i 's/^listeners=.*/listeners=PLAINTEXT:\/\/172.31.96.149:19095,CONTROLLER:\/\/172.31.96.149:29095/' /data/kafka_19095/config/kraft/server.properties
sed -i 's/^advertised.listeners=.*/advertised.listeners=PLAINTEXT:\/\/172.31.96.149:19095/' /data/kafka_19095/config/kraft/server.properties
cat /data/kafka_19095/config/kraft/server.properties | grep -Ev '^$|#' | egrep "(process.|node.id|controller.|listeners|log.dir|sadvertised.)"

KAFKA_CLUSTER_ID=asjC792iR3CMelxQGh923A
/data/kafka_19095/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /data/kafka_19095/config/kraft/server.properties

/data/kafka_19095/bin/kafka-broker-api-versions.sh --bootstrap-server 172.31.96.149:19093
```

## links

- [What is the proper way to check kafka cluster health?](https://stackoverflow.com/questions/38569336/what-is-the-proper-way-to-check-kafka-cluster-health)
