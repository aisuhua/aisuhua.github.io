# 添加域名解析

下面以 [CoreDNS](../../coredns/index.md) 为例，其他 DNS 做法类似。 

## 正向解析

新建 db.ocp1.example.com 文件，内容如下

```dns
$ORIGIN ocp1.example.com.
@	3600 IN	SOA example.com. example.com. (
				2017042745 ; serial
				7200       ; refresh (2 hours)
				3600       ; retry (1 hour)
				1209600    ; expire (2 weeks)
				3600       ; minimum (1 hour)
				)

	3600 IN NS ns.example.com.

api         IN A     192.168.1.10
api-int     IN A     192.168.1.10

*.apps      IN A     192.168.1.10

bootstrap   IN A     192.168.1.10

master1     IN A     192.168.1.20
master2     IN A     192.168.1.21
master3     IN A     192.168.1.22

worker1     IN A     192.168.1.30
worker2     IN A     192.168.1.31
worker3     IN A     192.168.1.32
```

## 反向解析

新建 db.1.168.192 文件，内容如下

```dns
@	3600 IN	SOA example.com. example.com. (
				2017042745 ; serial
				7200       ; refresh (2 hours)
				3600       ; retry (1 hour)
				1209600    ; expire (2 weeks)
				3600       ; minimum (1 hour)
				)

	3600 IN NS ns.example.com.

10     IN PTR     api.ocp1.example.com.
10     IN PTR     api-int.ocp1.example.com.
20     IN PTR     master1.ocp1.example.com.
21     IN PTR     master2.ocp1.example.com.
22     IN PTR     master3.ocp1.example.com.
30     IN PTR     worker1.ocp1.example.com.
31     IN PTR     worker2.ocp1.example.com.
32     IN PTR     worker3.ocp1.example.com.
```

## 配置到 Corefile

```corefile
.:53 {
    log
    errors
    cache

    file db.ocp1.example.com ocp1.example.com
    file db.1.168.192 1.168.192.in-addr.arpa
}
```

## 检查配置

运行以下脚本检查 DNS 是否都配置正确

```sh
#/bin/bash

DNS_IP=127.0.0.1

declare -A arr
arr[api.ocp1.example.com]=192.168.1.10
arr[api-int.ocp1.example.com]=192.168.1.10
arr[a.apps.ocp1.example.com]=192.168.1.10
arr[master1.ocp1.example.com]=192.168.1.20
arr[master2.ocp1.example.com]=192.168.1.21
arr[master3.ocp1.example.com]=192.168.1.22
arr[worker1.ocp1.example.com]=192.168.1.30
arr[worker2.ocp1.example.com]=192.168.1.31
arr[worker3.ocp1.example.com]=192.168.1.32

for key in "${!arr[@]}"; 
do 
    ip=$(dig @$DNS_IP +short $key)
    if [ "$ip" != "${arr[$key]}" ]; then
        echo "$key is ${arr[$key]}, result $ip"
    fi

    domain=$(dig @$DNS_IP +short -x ${arr[$key]})
    
    if [[ $key == a.* ]]; then
        continue
    fi

    if [[ $key == api* ]]; then
        domains=($domain)
        if [[ ! "${domains[*]}" =~ "${key}" ]]; then
            echo "${arr[$key]} is $key, result ${array[*]}"
        fi
    else
        if [[ ! "$domain" == "$key." ]]; then
            echo "${arr[$key]} is $key, result $domain"
        fi
    fi
done
```
