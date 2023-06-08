# 修改字符集为 utf8mb4

修改数据库的字符集为 utf8mb4，让它能存储 4 字节的 emoji 表情。

## 修改数据库

```sql
ALTER DATABASE database_name CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
```

## 修改表

```sql
ALTER TABLE table_name CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## 自动生成修改语句

创建 `gen_queries.sql` 文件，请用实际的数据库名称替换 `YOUR_DATABASE_NAME` 

```sql
USE information_schema;
SELECT CONCAT("ALTER DATABASE `",table_schema,"` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;") AS _sql
FROM `TABLES` WHERE table_schema LIKE "YOUR_DATABASE_NAME" AND TABLE_TYPE='BASE TABLE' GROUP BY table_schema UNION
SELECT CONCAT("ALTER TABLE `",table_schema,"`.`",table_name,"` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;") AS _sql
FROM `TABLES` WHERE table_schema LIKE "YOUR_DATABASE_NAME" AND TABLE_TYPE='BASE TABLE' GROUP BY table_schema, table_name UNION
SELECT CONCAT("ALTER TABLE `",`COLUMNS`.table_schema,"`.`",`COLUMNS`.table_name, "` CHANGE `",column_name,"` `",column_name,"` ",data_type,"(",character_maximum_length,") CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci",IF(is_nullable="YES"," NULL"," NOT NULL"),";") AS _sql
FROM `COLUMNS` INNER JOIN `TABLES` ON `TABLES`.table_name = `COLUMNS`.table_name WHERE `COLUMNS`.table_schema like "YOUR_DATABASE_NAME" and data_type in ('varchar','char') AND TABLE_TYPE='BASE TABLE' UNION
SELECT CONCAT("ALTER TABLE `",`COLUMNS`.table_schema,"`.`",`COLUMNS`.table_name, "` CHANGE `",column_name,"` `",column_name,"` ",data_type," CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci",IF(is_nullable="YES"," NULL"," NOT NULL"),";") AS _sql
FROM `COLUMNS` INNER JOIN `TABLES` ON `TABLES`.table_name = `COLUMNS`.table_name WHERE `COLUMNS`.table_schema like "YOUR_DATABASE_NAME" and data_type in ('text','tinytext','mediumtext','longtext') AND TABLE_TYPE='BASE TABLE';
```

生成修改语句 

```sql
mysql -u root -p -s < gen_queries.sql > queries.sql
```

执行修改语句

```sql
mysql -u root -p < queries.sql
```

## 参考

- [How to easily convert utf8 tables to utf8mb4 in MySQL 5.5](https://dba.stackexchange.com/a/104866)
- [utf8mb4-convert](https://github.com/fleio/utf8mb4-convert)
