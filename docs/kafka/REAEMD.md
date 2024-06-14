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
```

## links

- [What is the proper way to check kafka cluster health?](https://stackoverflow.com/questions/38569336/what-is-the-proper-way-to-check-kafka-cluster-health)
