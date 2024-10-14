# notes2

```sh
# Java 整形只有有符号整形，没有无符号整形。这一条跟 C 有点区别。

# float 类型的值需要以 f 结尾，浮点型默认是 double 类型
float f1 = 100.0f;
# error: incompatible types: possible lossy conversion from double to float
# float f2 = 100.0;

final double PI = 3.14;
# 使用 final 定义常量，常量一般定义为大写

# 使用 var 命令可以省略类型定义，会自动根据值的类型编译成类型定义
var str = "suhua is a good boy";
var num1 = 100;
var num2 = 100.0f;
var sb = new StringBuilder();
# 编译后 
StringBuilder sb = new StringBuilder();


```
