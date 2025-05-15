# Apollo 配置中心安装教程 

下面将按照[分布式部署指南](https://www.apolloconfig.com/#/zh/deployment/distributed-deployment-guide)安装 Apollo 2.3.0

## 下载安装介质

将所有安装介质下载到 `/opt` 目录

```sh
cd /opt
sudo wget https://github.com/apolloconfig/apollo/blob/master/scripts/sql/profiles/mysql-default/apolloconfigdb.sql
sudo wget https://github.com/apolloconfig/apollo/blob/master/scripts/sql/profiles/mysql-default/apolloportaldb.sql
sudo wget https://github.com/apolloconfig/apollo/releases/download/v2.3.0/apollo-portal-2.3.0-github.zip
sudo wget https://github.com/apolloconfig/apollo/releases/download/v2.3.0/apollo-configservice-2.3.0-github.zip
sudo wget https://github.com/apolloconfig/apollo/releases/download/v2.3.0/apollo-adminservice-2.3.0-github.zip
```

## 安装前准备 

### 创建程序用户

```sh
sudo useradd apollo
sudo useradd apollo;echo Pawrd01\!|passwd --stdin apollo
sudo chage -M 99999 apollo
```

### 创建安装目录

```sh
sudo mkdir /opt/apollo-configservice 
sudo mkdir /opt/apollo-adminservice
sudo mkdir /opt/apollo-portal
sudo mkdir /opt/logs
sudo chown apollo:apollo /opt/apollo-* /opt/logs
```

### 创建数据库

创建 `ApolloPortalDB` 和 `ApolloConfigDB` 两个数据库，使用管理员登录到数据库后，执行下面语句

```sql
source /opt/apolloportaldb.sql
source /opt/apolloconfigdb.sql
```

> 该步骤一般由数据库管理员执行

## 安装 ConfigService

解压安装包

```sh
sudo mv /opt/apollo-configservice-2.3.0-github.zip /opt/apollo-configservice
cd /opt/apollo-configservice
sudo unzip apollo-configservice-2.3.0-github.zip
sudo rm -f apollo-configservice-2.3.0-github.zip
chown -R apollo:apollo /opt/apollo-configservice
```

修改数据库连接配置

```sh
sudo vim /opt/apollo-configservice/config/application-github.properties
```

按实际填写数据库 IP、账号和密码信息

```ini
spring.datasource.url = jdbc:mysql://DB_HOST:DB_PORT/ApolloConfigDB?characterEncoding=utf8
spring.datasource.username = DB_USERNAME
spring.datasource.password = DB_PASSWORD
```

新增 systemd 进程管理配置

```sh
sudo vim /etc/systemd/system/apollo-configservice.service
```

将以下内容粘贴进去

```ini
[Unit]
Description=apollo-configservice
Requires=network.target
After=network.target

[Service]
Type=forking
User=apollo
Group=apollo
WorkingDirectory=/opt/apollo-configservice
ExecStart=/opt/apollo-configservice/scripts/startup.sh
ExecStop=/opt/apollo-configservice/scripts/shutdown.sh
LimitNOFILE=65536
TimeoutSec=120

[Install]
WantedBy=multi-user.target
```

启动 ConfigService 服务

```sh
sudo systemctl daemon-reload
sudo systemctl start apollo-configservice.service
```

## 安装 AdminService

解压安装包

```sh
sudo mv /opt/apollo-adminservice-2.3.0-github.zip /opt/apollo-adminservice
cd /opt/apollo-adminservice
sudo unzip apollo-adminservice-2.3.0-github.zip
sudo rm -f apollo-adminservice-2.3.0-github.zip
chown -R apollo:apollo /opt/apollo-adminservice
```

修改数据库连接配置

```sh
sudo vim /opt/apollo-adminservice/config/application-github.properties
```

按实际填写数据库 IP、账号和密码信息

```ini
spring.datasource.url = jdbc:mysql://DB_HOST:DB_PORT/ApolloConfigDB?characterEncoding=utf8
spring.datasource.username = DB_USERNAME
spring.datasource.password = DB_PASSWORD
```

新增 systemd 进程管理配置

```sh
sudo vim /etc/systemd/system/apollo-adminservice.service
```

将以下内容粘贴进去

```ini
[Unit]
Description=apollo-adminservice
Requires=network.target
After=network.target

[Service]
Type=forking
User=apollo
Group=apollo
WorkingDirectory=/opt/apollo-adminservice
ExecStart=/opt/apollo-adminservice/scripts/startup.sh
ExecStop=/opt/apollo-adminservice/scripts/shutdown.sh
LimitNOFILE=65536
TimeoutSec=120

[Install]
WantedBy=multi-user.target
```

启动 AdminService 服务

```sh
sudo systemctl daemon-reload
sudo systemctl start apollo-adminservice.service
```

## 安装 Portal

解压安装包

```sh
sudo mv /opt/apollo-portal-2.3.0-github.zip /opt/apollo-portal
cd /opt/apollo-portal
sudo unzip apollo-portal-2.3.0-github.zip
sudo rm -f apollo-portal-2.3.0-github.zip
chown -R apollo:apollo /opt/apollo-portal
```

修改数据库连接配置

```sh
sudo vim /opt/apollo-portal/config/application-github.properties
```

按实际填写数据库 IP、账号和密码信息

```ini
spring.datasource.url = jdbc:mysql://DB_HOST:DB_PORT/ApolloPortalDB?characterEncoding=utf8
spring.datasource.username = DB_USERNAME
spring.datasource.password = DB_PASSWORD
```

修改 apollo.portal.envs

```sh
sudo vim /opt/apollo-portal/config/apollo-env.properties
```

测试环境修改如下

```ini
dev.meta=http://CONFIGSERVICE_SERVER1:8080,http://CONFIGSERVICE_SERVER2:8080,...
```

生产环境修改如下

```ini
pro.meta=http://CONFIGSERVICE_SERVER1:8080,http://CONFIGSERVICE_SERVER2:8080,...
```

新增 systemd 进程管理配置

```sh
sudo vim /etc/systemd/system/apollo-portal.service
```

将以下内容粘贴进去

```ini
[Unit]
Description=apollo-portal
Requires=network.target
After=network.target

[Service]
Type=forking
User=apollo
Group=apollo
WorkingDirectory=/opt/apollo-portal
ExecStart=/opt/apollo-portal/scripts/startup.sh
ExecStop=/opt/apollo-portal/scripts/shutdown.sh
LimitNOFILE=65536
TimeoutSec=120

[Install]
WantedBy=multi-user.target
```

启动 Portal 服务

```sh
sudo systemctl daemon-reload
sudo systemctl start apollo-portal.service
```

## 部署后验证

浏览器打开 http://PORTAL_SERVER:8070，使用用户名 apollo，密码 admin 登录到控制台进行管理。

## link
- [3.1 最简高可用，单环境](https://www.apolloconfig.com/#/zh/deployment/deployment-architecture?id=_31-%e6%9c%80%e7%ae%80%e9%ab%98%e5%8f%af%e7%94%a8%ef%bc%8c%e5%8d%95%e7%8e%af%e5%a2%83)
- eureka 开启认证 [1](https://github.com/apolloconfig/apollo/issues/5308)、[2](https://github.com/apolloconfig/apollo/issues/3636)、[3](https://github.com/apolloconfig/apollo/issues/4901) 
- [开源配置中心 Apollo 的设计与实现](https://www.infoq.cn/article/open-source-configuration-center-apollo)
