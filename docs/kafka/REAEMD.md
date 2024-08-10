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
/opt/kafka/2.13-3.8.0/server1/bin/kafka-topics.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf --list
/opt/kafka/2.13-3.8.0/server1/bin/kafka-topics.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf --create --topic hello
/opt/kafka/2.13-3.8.0/server1/bin/kafka-topics.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf --describe --topic hello 

# product and consume
/opt/kafka/2.13-3.8.0/server1/bin/kafka-console-producer.sh --bootstrap-server 172.31.96.149:19093 --producer.config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf --topic hello
/opt/kafka/2.13-3.8.0/server1/bin/kafka-console-consumer.sh --bootstrap-server 172.31.96.149:19093 --consumer.config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf --topic hello --from-beginning

# version
/opt/kafka/2.13-3.8.0/server1/bin/kafka-metadata-quorum.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf describe --status
/opt/kafka/2.13-3.8.0/server1/bin/kafka-broker-api-versions.sh --bootstrap-server 172.31.96.149:19093 --command-config /opt/kafka/2.13-3.8.0/server1/config/kraft/admin.conf






# one time
curl -sL http://192.168.88.61/other/kafka_2.12-3.5.2.tgz -o /opt/kafka_2.12-3.5.2.tgz
tar -xzf /opt/kafka_2.12-3.5.2.tgz -C /opt/


cp -r /opt/kafka_2.12-3.5.2 /data/kafka_9092
cp /data/kafka_9092/config/kraft/server.properties /data/kafka_9092/config/kraft/server.properties.bak.$(date +%Y%m%d%H%M%S)
sed -i 's/^process.roles=.*/process.roles=broker,controller/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^controller.quorum.voters=.*/controller.quorum.voters=1@172.31.96.149:19092,2@172.31.96.139:19093,3@172.31.96.143:19094/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^log.dirs=.*/log.dirs=\/data\/kafka_9092\/logs/' /data/kafka_9092/config/kraft/server.properties

# node1
cp -r /opt/kafka_2.12-3.5.2 /data/kafka_9093
sed -i 's/^node.id=.*/node.id=1/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^listeners=.*/listeners=PLAINTEXT:\/\/172.31.96.149:9093,CONTROLLER:\/\/172.31.96.149:9093/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^advertised.listeners=.*/advertised.listeners=PLAINTEXT:\/\/172.31.96.149:9092/' /data/kafka_9092/config/kraft/server.properties
cat /data/kafka_9092/config/kraft/server.properties | grep -Ev '^$|#' | egrep "(process.|node.id|controller.|listeners|log.dir|sadvertised.)"

# node2
sed -i 's/^node.id=.*/node.id=2/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^listeners=.*/listeners=PLAINTEXT:\/\/172.31.96.139:9092,CONTROLLER:\/\/172.31.96.139:9093/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^advertised.listeners=.*/advertised.listeners=PLAINTEXT:\/\/172.31.96.139:9092/' /data/kafka_9092/config/kraft/server.properties
cat /data/kafka_9092/config/kraft/server.properties | grep -Ev '^$|#' | egrep "(process.|node.id|controller.|listeners|log.dir|sadvertised.)"

# node3
sed -i 's/^node.id=.*/node.id=3/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^listeners=.*/listeners=PLAINTEXT:\/\/172.31.96.143:9092,CONTROLLER:\/\/172.31.96.143:9093/' /data/kafka_9092/config/kraft/server.properties
sed -i 's/^advertised.listeners=.*/advertised.listeners=PLAINTEXT:\/\/172.31.96.143:9092/' /data/kafka_9092/config/kraft/server.properties
cat /data/kafka_9092/config/kraft/server.properties | grep -Ev '^$|#' | egrep "(process.|node.id|controller.|listeners|log.dir|sadvertised.)"
```

## links

- [What is the proper way to check kafka cluster health?](https://stackoverflow.com/questions/38569336/what-is-the-proper-way-to-check-kafka-cluster-health)
