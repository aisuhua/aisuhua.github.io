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

# 修改成自动 reload
vim $CATALINA_HOME/conf/context.xml
<Context reloadable="true">
...
</Context>

# 启动 tomcat
$CATALINA_HOME/bin/startup.sh
```

## 部署 java demo

源代码: https://github.com/aisuhua/war-sample

```sh
# 下载源代码到 webapps 目录
cd $CATALINA_HOME/webapps
git clone git@github.com:aisuhua/war-sample.git

# 测试 
curl http://localhost:8080/war-sample/
```

## 部署 war 包

```sh
# 将源代码打包成 war 包
cd $CATALINA_HOME/webapps/war-sample
jar -cvf war-sample *
```
