# htpasswd

## 安装

```sh
# Ubuntu
sudo apt install apache2-utils

# Redhat
sudo yum install httpd-tools
```

## 新建用户

```sh
htpasswd -c /path/to/.htpasswd aisuhua
```

## 追加用户

```sh
htpasswd /path/to/.htpasswd lala
```

## ref

- [How to Create and Use .htpasswd](https://www.hostwinds.com/tutorials/create-use-htpasswd)
