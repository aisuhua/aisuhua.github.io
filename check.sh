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

