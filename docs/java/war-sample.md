# War Sample

一个快速入门的使用 tomcat 部署 Java 应用的例子。

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

## Java 源码部署

源代码: https://github.com/aisuhua/war-sample

```sh
# 下载源代码到 webapps 目录
cd $CATALINA_HOME/webapps
git clone git@github.com:aisuhua/war-sample.git

# 测试 
curl http://localhost:8080/war-sample/
```

## 重新编译 class 文件

```sh
# 先确定 servlet jar 包的位置
$ ls /usr/share/java/ | grep servlet
guice-servlet-4.0.jar
guice-servlet.jar
tomcat8-servlet-api-8.5.39.jar
tomcat8-servlet-api.jar

# 设置 CLASSPATH 环境变量
export CLASSPATH="/usr/share/java/*"

# 重新编译 HelloServlet.java
cd $CATALINA_HOME/webapps/war-sample/WEB-INF/classes/test
javac HelloServlet.java
```

## War 包部署

```sh
# 将源代码打包成 War 包
git clone git clone git@github.com:aisuhua/war-sample.git
cd war-sample
jar -cvf war-sample.war *

# 将 war 包放置到 webapps 目录
mv war-sample.war $CATALINA_HOME/webapps/

# 测试 
curl http://localhost:8080/war-sample/
```

## 其他

```sh
# 查看 Java 可用版本
update-java-alternatives -l

# 查看日志
tail -f $CATALINA_HOME/logs/*.log
```

## 参考文献

1. [Sample Application](https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/)
2. [a hello, world servlet](https://www.caucho.com/resin-3.1/examples/servlet-hello/index.xtp)
3. [Servlets - Examples](https://www.tutorialspoint.com/servlets/servlets-first-example.htm)
4. [How to Install Apache Tomcat 8 on Ubuntu](https://www.inmotionhosting.com/support/edu/software/how-to-install-apache-tomcat-8-on-ubuntu/)
5. [Tomcat - CATALINA_BASE and CATALINA_HOME variables](https://stackoverflow.com/questions/3090398/tomcat-catalina-base-and-catalina-home-variables)
6. [javac command line compile error: package javax.servlet does not exist](https://stackoverflow.com/a/16778259)
7. [War File](https://www.javatpoint.com/war-file)
8. [How do I update a Tomcat webapp without restarting the entire service?](https://stackoverflow.com/a/24787657)
9. [How To Install Apache Tomcat 8 on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-ubuntu-16-04)
