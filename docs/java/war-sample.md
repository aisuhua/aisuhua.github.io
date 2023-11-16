# War Sample

## 安装 tomcat

```sh
# 安装 JDK
sudo apt install default–jdk

# 解压安装包
cd /opt/www
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
tar -zxvf apache-tomcat-9.0.83.tar.gz

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export CATALINA_HOME=/opt/www/apache-tomcat-9.0.83

# 启动 tomcat
$CATALINA_HOME/bin/startup.sh
```

## 配置 tomcat


