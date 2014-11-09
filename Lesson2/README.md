#Lesson2
##1.控制流
Swift中的控制语句有以下几类：

* 分支语句：`if`和`swith`
* 循环语句：`while`、`do while`、`for`和`for in`
* 跳转语句：`break`、`continue`、`fallthrough`和`return`

###条件语句
Swift提供两种类型的条件语句：`if`语句和`switch`语句。通常，当条件较为简单且可能的情况很少时，使用`if`语句。而`switch`语句更适用于条件较复杂、可能情况较多且需要用到模式匹配（pattern-matching）的情境。

####if
`if`语句最简单的形式就是只包含一个条件，当且仅当该条件为`true`时，才执行相关代码：

```
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
}
// 输出 "It's very cold. Consider wearing a scarf."
```
当然，`if`语句允许二选一，也就是当条件为`false`时，执行 `else` 语句：

```
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's not that cold. Wear a t-shirt."
```

也可以把多个`if`语句链接在一起，像下面这样：

```
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    println("It's really warm. Don't forget to wear sunscreen.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's really warm. Don't forget to wear sunscreen."
```

####switch语句
Swift彻底颠覆了自C语言以来大家对`switch`的认知，主要表现在以下两方面：  
一方面，在大部分言中，`switch`语句只能比较离散的单个整数（或可以自动转换为整数）变量，而Swift中的`switch`语句可以使用整数、浮点数、字符、字符串、和元组等类型，而且它的数值可以是离散的也可以是连续的范围。  
别一方面，与 C 语言和 Objective-C 中的`switch`语句不同，在 Swift 中，当匹配的 `case` 分支中的代码执行完毕后，程序会终止`switch`语句，而不会继续执行下一个 `case` 分支。这也就是说，不需要在 `case` 分支中显式地使用break语句。这使得switch语句更安全、更易用，也避免了因忘记写break语句而产生的错误。  
下面我们介绍下`switch`语句基本形式的语法结构：

```
switch 条件表达式{
  case 值1:
  语句组1
  case 值2,值3,值4:
  语句组2
  ...
  case 值n:
  语句组n
  default:
  语句组n+1
}
```
示例代码如下：

```
// 数值的匹配，下面的整数也可以换成浮点数
let testScore = 86
var grade:Character
switch testScore / 10 {
case 9:
    grade = "优"
case 8:
    grade = "良"
case 7,6:
    grade = "中"
default:
    grade = "差"
}
println("Grade = \(grade)")
```
下面是字符的比较示例：

```
// 字符的匹配
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    println("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    println("\(someCharacter) is a consonant")
default:
    println("\(someCharacter) is not a vowel or a consonant")
}
// 输出 "e is a vowel"
```
每一个 `case` 分支都必须包含至少一条语句。像下面这样书写代码是无效的，因为第一个 `case` 分支是空的：

```
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a":
case "A":
    println("The letter A")
default:
    println("Not the letter A")
}
// this will report a compile-time error
```
不像 C 语言里的switch语句，在 Swift 中，`switch`语句不会同时匹配"a"和"A"。相反的，上面的代码会引起编译期错误。这就避免了意外地从一个 `case` 分支贯穿到另外一个，使得代码更安全、也更直观。

####使用范围匹配
对于数值类型的比较，`switch`中的`case`还可以指定一个范围。示例代码如下：

```
let testscore = 80
var grade:Character
switch testscore {
case 90...100:
    grade = "优"
case 80..<90:
    grade = "良"
case 60..<80:
    grade = "中"
case 0..<60:
    grade = "差"
default:
    grade = "无"
}
println("Grade = \(grade)")
```
>在定义范围的时候，我们使用了闭区间（`...`）和半区间（`..`）运算符

###使用元组类型
元组作为多个值的表示方式也可以在Swift中进行比较。`switch`使用元组非常灵活，字段可以是普通值，也可以是范围。

```
var student = (id:"1002", name:"李四", age:32, ChineseScore:80, EnglishScore:89)

var desc:String

switch student {
case (_, _, _, 90...100, 90...100):
    desc = "优"
case (_, _, _, 80..<90, 80..<90):
    desc = "良"
case (_, _, _, 60..<80, 60..<80):
    desc = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc = "严重偏科"
default:
    desc = "无"
}

println("说明：\(desc)")
```

在`switch`中使用元组时还可以使用**值绑定**和**where**语句
####值绑定
使用元组的时候还可以在`case`分支中将匹配的值绑定到一个临时的常量或变量， 这些常量或变量能够在该分支里使用，这被称为**值绑定**

```
var student = (id:"1002", name:"李四", age:32, ChineseScore:90, EnglishScore:91)

var desc:String

switch student {
case (_, _, let age, 90...100, 90...100):
    if (age > 30) {
       desc = "老优"
    } else {
        desc = "小优"
    }
case (_, _, _, 80..<90, 80..<90):
    desc = "良"
case (_, _, _, 60..<80, 60..<80):
    desc = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc = "严重偏科"
default:
    desc = "无"
}

println("说明：\(desc)")
```

####where语句
在值绑定的情况下，还可以在`case`中使用`where`语句，进行过滤，类似于SQL语句中的`where`子句

```
var student = (id:"1002", name:"李四", age:32, ChineseScore:90, EnglishScore:91)

var desc:String

switch student {
case (_, _, let age, 90...100, 90...100) where age > 0:
    desc = "优"
case (_, _, _, 80..<90, 80..<90):
    desc = "良"
case (_, _, _, 60..<80, 60..<80):
    desc = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc = "严重偏科"
default:
    desc = "无"
}

println("说明：\(desc)")
```

###循环语句
Swift编程语言支持4种循环构造类型

* `while`
*  `do while`
*  `for`
*  `for in`

####while语句
`while`语句是一种先判断的循环结构，格式如下

```
while 循环条件 {
  语句组
}
```
`while`循环没有初始化语句，循环次数是不可知的，只要循环条件满足，循环就会一直进行下去

```
var i = 0

while i * i < 100000 {
    i++
}

println("i = \(i)")
println("i * i = \(i * i)")
```

####do while语句
`do while`语句的使用与`while`语句相似，不过`do while`语句是事后判断循环条件结构，语句格式如下：

```
do {
  语句组
} while 循环条件
```
`do while`循环没有初始化语句，循环次数是不可知的，不管循环条件是否满足，都会先执行一次循环体，然后再判断循环条件。如果条件满足则执行循环体，不满足则停止循环

```
var i = 0

do{
    i++
} while  i * i < 100000

println("i = \(i)")
println("i * i = \(i * i)")
```

####for语句
`for`语句是应用最广泛、功能最强的一种循环语句，格式如下

```
for 初始化; 循环条件; 迭代 {
  语句组
}
```
示例代码如下

```
for var index = 0; index < 3; ++index {
    println("index is \(index)")
}
// index is 0
// index is 1
// index is 2
```

####for in语句
你可以使用`for-in`循环来遍历一个集合里面的所有元素，例如由数字表示的区间、数组中的元素、字符串中的字符  
使用区间的循环：

```
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
```
遍历一个数组所有元素：

```
let names = ["Anna", "Alex"]
for name in names {
    println("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
```
遍历字典：

```
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}
// spiders have 8 legs
// ants have 6 legs
// cats have 4 legs
```
遍历字符串中的字符：

```
for character in "Hello" {
    println(character)
}
// H
// e
// l
// l
// o
```
###跳转语句
Swift有四种控制转移语句

* continue
* break
* fallthrough
* return

我们将会在下面讨论`continue`、`break`和`fallthrough`语句。`return`语句将会在函数章节讨论。

####continue
`continue`语句告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。就好像在说“本次循环迭代我已经执行完了”，但是并不会离开整个循环体。

```
let numbers = [1, 2, 3, 4, 5]
for var i = 0; i < countElements(numbers); i++
{
    if i == 3 {
        continue
    }
    println("Count is: \(i)")
}
// Count is: 0
// Count is: 1
// Count is: 2
// Count is: 4
```
`continue`还可以使用带标签的语句来进行更灵活地语句转移控制

```
label1: for var x = 0; x < 3; x++ {   
    label2: for var y = 3; y > 0; y-- {
        if y == x {
            continue label1
        }
        println("(x,y) = (\(x),\(y))")
    }
}
// (x,y) = (0,3)
// (x,y) = (0,2)
// (x,y) = (0,1)
// (x,y) = (1,3)
// (x,y) = (1,2)
// (x,y) = (2,3)
```
####break
`break`语句会立刻结束整个控制流的执行。

```
let numbers = [1, 2, 3, 4, 5]
for var i = 0; i < countElements(numbers); i++
{
    if i == 3 {
        break
    }
    println("Count is: \(i)")
}
// Count is: 0
// Count is: 1
// Count is: 2
```
`break`同样也可以使用带标签的语句

```
label1: for var x = 0; x < 3; x++ {    
    label2: for var y = 3; y > 0; y-- {
        if y == x {
            break label1
        }
        println("(x,y) = (\(x),\(y))")
    }
}
// (x,y) = (0,3)
// (x,y) = (0,2)
// (x,y) = (0,1)
// (x,y) = (1,3)
// (x,y) = (1,2)
```

####fallthrough
Swift 中的`switch`不会从上一个 `case` 分支落入到下一个 `case` 分支中。相反，只要第一个匹配到的 `case` 分支完成了它需要执行的语句，整个`switch`代码块完成了它的执行。相比之下，C 语言要求你显示的插入`break`语句到每个switch分支的末尾来阻止自动落入到下一个 `case` 分支中。Swift 的这种避免默认落入到下一个分支中的特性意味着它的`switch` 功能要比 C 语言的更加清晰和可预测，可以避免无意识地执行多个 `case` 分支从而引发的错误。

如果你确实需要 C 风格的贯穿（`fallthrough`）的特性，你可以在每个需要该特性的 `case` 分支中使用`fallthrough`关键字。下面的例子使用`fallthrough`来创建一个数字的描述语句。

```
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
println(description)
// 输出 "The number 5 is a prime number, and also an integer."
```