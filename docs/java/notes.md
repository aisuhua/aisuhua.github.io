# 学习笔记

## 官方学习材料

- https://docs.oracle.com/javase/8/index.html
- http://docs.oracle.com/javase/tutorial/java/index.html
- https://docs.oracle.com/javase/8/docs/api/index.html

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
# 或者
cd  /opt/www/java/tutorial/demo03/package
java -cp bin my.Main

# 查看目录结构
cd /opt/www/java/tutorial/demo03/package
tree
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

# 打成 jar 包
# The c option indicates that you want to create a JAR file.
# The f option indicates that you want the output to go to a file rather than to stdout.
# jar-file is the name that you want the resulting JAR file to have. You can use any filename for a JAR file. By convention, JAR filenames are given a .jar extension, though this is not required.
# The -C images part of this command directs the Jar tool to go to the bin directory, and the . following -C bin directs the Jar tool to archive all the contents of that directory.
# -C 是告知 jar 工具先进入 bin 目录，. 表示打包该目录的所有文件
jar -cvf hello.jar -C bin .

# 或者
cd bin
jar -cvf hello.jar *

# 执行 jar 包
java -cp ./hello.jar my.Main

# 修改 mainfest 文件内容
# The m option indicates that you want to merge information from an existing file into the manifest file of the JAR file you're creating.
jar -cvfm hello.jar manifest.txt -C bin .

# manifest.txt
Main-Class: my.Main
Built-By: aisuhua

# 执行 jar
java -jar hello.jar

# 字符串
String str = "suhua123";
System.out.println(str);

String str2 = new String("suhua123");
System.out.println(str2);

# 内部实际上用字符数组来表示
String str3 = new String(new char[] {'s', 'u', 'h', 'u', 'a', '1', '2', '3'});
System.out.println(str3);

# for 循环
for (String value : str.split(" ")) {
    System.out.println(value);
}

String arr[] = str.split(" ");
for (int i = 0; i < arr.length; i++) {
    System.out.println(arr[i]);
}

# Integer.valueOf()就是静态工厂方法，它尽可能地返回缓存的实例以节省内存。
# 创建新对象时，优先选用静态工厂方法而不是new操作符。

# 字符串和数字类型互转
int x = Integer.parseInt("100");
String s = Integer.toString(100);

# 数据的存储和显示要分离

# record 关键字用于定义 Data Class
# 使用record定义的是不变类；
# 可以编写Compact Constructor对参数进行验证；
# 可以定义静态方法。

# 迭代器
List<Integer> list = List.of(1, 2, 3);
for (Integer i : list) {
    System.out.println(i);
}

Iterator<Integer> iterator = list.iterator();
while (iterator.hasNext()) {
    System.out.println(iterator.next());
}

# 数组的创建方式
# 方式1
String[] arr = new String[3];
arr[0] = "A";
arr[1] = "B";
arr[2] = "C";
# 方式2
String[] arr = new String[]{"A", "B", "C"};
# 方式3
String[] arr = {"A", "B", "C"};

# List 创建的方式
# 方式１：每个项类型不确定
List list = new ArrayList();
# 方式2
 List<String> list = new ArrayList<String>();
# 方式3
List<String> list = new ArrayList<>();
list.add("A");
list.add("B");
System.out.println(list);
# 方式4 list.of()
List<String> list = List.of("A", "B");

```

## links

- [How to create jar file with package structure?](https://stackoverflow.com/questions/18146361/how-to-create-jar-file-with-package-structure)
- [Creating a JAR File](https://docs.oracle.com/javase/tutorial/deployment/jar/build.html)
- [Modifying a Manifest File](https://docs.oracle.com/javase/tutorial/deployment/jar/modman.html)

