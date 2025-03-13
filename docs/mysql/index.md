# MySQL

## 8.0

```sh
# 修改 root 密码
sudo mysql 
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'React123$1';
exit;
mysql -u root -p
```

- [How to reset the root password in MySQL 8.0.11?](https://stackoverflow.com/questions/50691977/how-to-reset-the-root-password-in-mysql-8-0-11)


## Database

```sql
# 创建数据库
CREATE DATABASE mydatabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## 创建用户

```sql
# 创建用户
CREATE USER 'username'@'172.16.%' IDENTIFIED BY 'password';

# 授权
GRANT SELECT, INSERT, UPDATE, DELETE ON `dbname`.* TO 'username'@'172.16.%'

# 授予管理员权限
GRANT ALL PRIVILEGES ON *.* TO 'username'@`172.16.%`;
```

## 使用

```sql
# 截取字符串
SELECT CHAR_LENGTH("Have_a_good_day") - LOCATE('_', REVERSE("Have_a_good_day"))+1;
```

## Links

- [Last index of a given substring in MySQL](https://stackoverflow.com/questions/12775352/last-index-of-a-given-substring-in-mysql)
