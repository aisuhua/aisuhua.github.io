# MySQL

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
