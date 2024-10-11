# Spring Boot

```sh
# 安装 JDK
wget https://download.oracle.com/java/17/archive/jdk-17.0.8_linux-x64_bin.tar.gz
tar -zxvf jdk-17.0.8_linux-x64_bin.tar.gz
export PATH=/path/to/jdk-17.0.8/bin:$PATH
java -version

# 安装 maven
wget https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
tar apache-maven-3.8.8-bin.tar.gz
# vim /etc/profile.d/maven.sh
export JAVA_HOME=/path/to/jdk-17.0.8
export M2_HOME=/path/to/apache-maven-3.8.8
export MAVEN_HOME=/path/to/apache-maven-3.8.8
export PATH=${M2_HOME}/bin:${PATH}
mvn --version

# Spring Boot demo
# vim pom.yaml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>myproject</artifactId>
    <version>0.0.1-SNAPSHOT</version>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.5</version>
    </parent>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
    </dependencies>

    <!-- Additional lines to be added here... -->

</project>

mvn dependency:tree
mkdir -p src/main/java
# vim MyApplication.java
package com.example;

@RestController
@SpringBootApplication
public class MyApplication {

    @RequestMapping("/")
    String home() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }

}

mvn spring-boot:run

# Exception
package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class MyApplication {

    @RequestMapping("/")
    String home() throws Exception {
        throw new Exception("Exception message");
    }

    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }

}

# maven 国内源
# vim /opt/to/apache-maven-3.8.8/conf/settings.xml 
# 追加到 mirrors
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

## links

- [How to Install Apache Maven on Ubuntu 18.04](https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/)
- [Maven 镜像](https://developer.aliyun.com/mirror/maven/)
- [Throwing Exceptions in Java](https://rollbar.com/guides/java/how-to-throw-exceptions-in-java/)
- [Java SE Development Kit 17.0.8](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
- https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/
- [Getting Started](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html)
- https://docs.spring.io/spring-boot/docs/2.1.13.RELEASE/reference/html/boot-features-logging.html
- https://docs.spring.io/spring-boot/docs/1.2.1.RELEASE/reference/html/boot-features-logging.html#:~:text=Spring%20Boot%20uses%20Commons%20Logging,optional%20file%20output%20also%20available.
- https://github.com/hpcugent/logstash-patterns/blob/master/files/grok-patterns
