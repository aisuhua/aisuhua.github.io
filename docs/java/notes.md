# 学习笔记

```sh
# 整形类型
byte：-128 ~ 127
short: -32768 ~ 32767
int: -2147483648 ~ 2147483647
long: -9223372036854775808 ~ 9223372036854775807

# 浮点型
# float 数字最后记得加 f，不加默认是 double
float f1 = 3.14f;
double d = 1.79e308;

# char 类型，都 ' 单引号括起来
char c1 = 'a';
char c2 = '中';

# String 引用类型，不可变类型
# final 声明不可变的变量即常量，后续无法赋值
final double PI = 3.14;

# var 关键字声明变量会自动根据值的类型创建
var i = 100; // int
# 两者效果一样
StringBuilder sb = new StringBuilder();
var sb = new StringBuilder();

# 变量的作用域
{
    ...
    int i = 0; // 变量i从这里开始定义
    ...
    {
        ...
        int x = 1; // 变量x从这里开始定义
        ...
        {
            ...
            String s = "hello"; // 变量s从这里开始定义
            ...
        } // 变量s作用域到此结束
        ...
        // 注意，这是一个新的变量s，它和上面的变量同名，
        // 但是因为作用域不同，它们是两个不同的变量:
        String s = "hi";
        ...
    } // 变量x和s作用域到此结束
    ...
} // 变量i作用域到此结束

# 整数相除得到精确结果
int x = 12345 / 67; // 184
# 求余数
int y = 12345 % 67; // 12345÷67的余数是17

# 运算过程中会自动将小类型转成大类型，反方向转可能会溢出导致结果不正确
# 如 short 转成 int 再运算
short s = 1234;
int i = 123456;
int x = s + i; // s自动转型为int

# 强制类型转换
int i = 12345;
short s = (short) i; // 12345
int n1 = (int) 12.3; // 12 只保留整数部分
int n2 = (int) 12.7; // 12
int n2 = (int) -12.7; // -12
int n3 = (int) (12.7 + 0.5); // 13
int n4 = (int) 1.2e20; // 2147483647

# 四舍五入，加 0.5 然后强制转换成 int 类型即可
double d = 2.6;
int n = (int) (d + 0.5);

# 字符串使用 + 号连接
System.out.println("Hello" + " " + "World!")

# 使用 """ 多行模式
String s2 = """
        Hello 
            second Hello
        third Hello""";

# 在一个文件里可以写多个类，但是只能有一个 public class 类

# 手工编译 packages
find src -name "*.java" | xargs javac -d bin

# 运行包程序
java -cp /opt/www/java/tutorial/demo03/package/bin  my.Main
java -cp bin my.Main

# 打成 jar 包
jar -cvf hello.jar -C bin .
.
├── bin
│   ├── my
│   │   └── Main.class
│   ├── org
│   │   └── baidu
│   │       └── Student.class
│   └── suhua
│       └── Person.class
├── hello.jar
└── src
    ├── my
    │   └── Main.java
    ├── org
    │   └── baidu
    │       └── Student.java
    └── suhua
        └── Person.java

# 执行 jar 包
java -cp hello.jar my.Main
```

## links

- [How to create jar file with package structure?](https://stackoverflow.com/questions/18146361/how-to-create-jar-file-with-package-structure)


































