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

##2.集合
Swift 语言提供经典的数组和字典两种集合类型来存储集合数据。数组用来按顺序存储相同类型的数据。字典虽然无序存储相同类型数据值但是需要由独有的标识符引用和寻址（就是键值对）  
Swift 语言里的数组和字典中存储的数据值类型必须明确。 这意味着我们不能把不正确的数据类型插入其中。 同时这也说明我们完全可以对获取出的值类型非常自信。
###数组
数组使用有序列表存储相同类型的多重数据。相同的值可以多次出现在一个数组的不同位置中  
Swift 数组对存储数据有具体要求。 不同于 Objective-C 的`NSArray`和`NSMutableArray`类，他们可以存储任何类型的实例而且不提供他们返回对象的任何本质信息。 在 Swift 中，数据值在被存储进入某个数组之前类型必须明确，方法是通过显式的类型标注或类型推断
####数组声明与初始化
数组的声明：

```
var array:Array<SomeType>
var array:[SomeType]
```
`SomeType`是这个数组中唯一允许存在的数据类型  
数组的初始化：

```
var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList2 = ["Eggs", "Milk"]
var shoppingList3 = [String]()
```
`[String]()`初始化了一个空的数组

####访问和修改
我们可以通过数组的方法和属性来访问和修改数组，或者下标语法。 还可以使用数组的只读属性`count`来获取数组中的数据项数量。

```
println("The shopping list contains \(shoppingList.count) items.")
// 输出"The shopping list contains 2 items."
```
使用布尔项`isEmpty`来作为检查`count`属性的值是否为 0 的捷径

```
if shoppingList.isEmpty {
    println("The shopping list is empty.")
} else {
    println("The shopping list is not empty.")
}
// 打印 "The shopping list is not empty."
```
在数组后面添加新的数据项

```
shoppingList.append("Flour")
println(shoppingList)
// ["Eggs", "Milk", "Flour"]
shoppingList += ["Cheese", "Butter"]
println(shoppingList)
// ["Eggs", "Milk", "Flour","Cheese", "Butter"]
```
通过下标来访问和修改数组中的数据项

```
println(shoppingList[0])
// Eggs
shoppingList[0] = "Chocolate"
println(shoppingList[0])
// Chocolate
shoppingList[2...4] = ["Bananas", "Apples"]
println(shoppingList)
// ["Chocolate", "Milk", "Bananas", "Apples"]
```
通过方法修改数组中的数据项

```
shoppingList.insert("Cake", atIndex:1)
println(shoppingList)
// ["Chocolate", "Cake", "Milk", "Bananas", "Apples"]
var item = shoppingList.removeAtIndex(1)
println(shoppingList)
// ["Chocolate", "Milk", "Bananas", "Apples"]
var last = shoppingList.removeLast()
println(shoppingList)
// ["Chocolate", "Milk", "Bananas"]
```
####数组的遍历
```
for item in shoppingList {
    println(item)
}
for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}
```

###字典
字典是一种存储相同类型多重数据的存储器。每个值（value）都关联独特的键（key），键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序  
Swift 的字典使用时需要具体规定可以存储键和值类型。不同于 Objective-C 的`NSDictionary`和N`SMutableDictionary` 类可以使用任何类型的对象来作键和值并且不提供任何关于这些对象的本质信息。在 Swift 中，在某个特定字典中可以存储的键和值必须提前定义清楚，方法是通过显性类型标注或者类型推断
####字典声明和初始化
```
var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
var emptyDiction = Dictionary<String, String>()
```
####访问和修改
```
println("The dictionary of airports contains \(airports.count) items.")
// 打印 "The dictionary of airports contains 2 items."
airports["LHR"] = "London"
// airports 字典现在有三个数据项
airports["LHR"] = "London Heathrow"
// "LHR"对应的值 被改为 "London Heathrow
if let oldValue = airports.updateValue("Dublin Internation", forKey: "DUB") {
    println("The old value for DUB was \(oldValue).")
}
// 输出 "The old value for DUB was Dublin."（dub原值是dublin
if let airportName = airports["DUB"] {
    println("The name of the airport is \(airportName).")
} else {
    println("That airport is not in the airports dictionary.")
}
// 打印 "The name of the airport is Dublin INTernation."
airports["APL"] = "Apple Internation"
// "Apple Internation"不是真的 APL机场, 删除它
airports["APL"] = nil
// APL现在被移除了
if let removedValue = airports.removeValueForKey("DUB") {
    println("The removed airport's name is \(removedValue).")
} else {
    println("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin International."
```
####遍历字典
```
for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}
// TYO: Tokyo
// LHR: London Heathrow
```
也可以通过访问他的`keys`或者`values`属性（都是可遍历集合）检索一个字典的键或者值：

```
for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}
for airportName in airports.values {
    println("Airport name: \(airportName)")
}
```
###集合的复制
Swift中的集合都是结构体类型，即值类型。值类型在赋值或参数传递时会发生复制行为，赋予的值或传递的参数是一个副本

```
var students = [101:"Tom",102:"Jerry"]
var copyStudents = students
copyStudents[101] = "Tomy"
println(students)
println(copyStudents)
```
##3.函数
在 Swift 中，每个函数都有一种类型，包括函数的参数值类型和返回值类型。你可以把函数类型当做任何其他普通变量类型一样处理，这样就可以更简单地把函数当做别的函数的参数，也可以从其他函数中返回函数。函数的定义可以写在在其他函数定义中，这样可以在嵌套函数范围内实现功能封装

###函数的定义与调用
在下面例子中的函数叫做"greetingForPerson"，之所以叫这个名字是因为这个函数用一个人的名字当做输入，并返回给这个人的问候语。为了完成这个任务，你定义一个输入参数-一个叫做 `personName` 的 `String` 值，和一个包含给这个人问候语的 `String` 类型的返回值：

```
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
println(sayHello("Anna"))
// prints "Hello, Anna!"
```
所有的这些信息汇总起来成为函数的定义，并以 `func` 作为前缀。指定函数返回类型时，用返回箭头 ->（一个连字符后跟一个右尖括号）后跟返回类型的名称的方式来表示

###函数参数与返回值
####多重输入参数
函数可以有多个输入参数，写在圆括号中，用逗号分隔

```
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
println(halfOpenRangeLength(1, 10))
// prints "9
```

####无参函数

```
func sayHelloWorld() -> String {
    return "hello, world"
}
println(sayHelloWorld())
```

####无返回值函数

```
func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!
```
因为这个函数不需要返回值，所以这个函数的定义中没有返回箭头（`->`）和返回类型
>严格上来说，虽然没有返回值被定义，sayGoodbye 函数依然返回了值。没有定义返回类型的函数会返回特殊的值，叫 `Void`。它其实是一个空的元组（`tuple`），没有任何元素，可以写成`()`

####多重返回值函数
你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回

```
func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string {
        switch String(character).lowercaseString {
        case "a", "e", "i", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            ++consonants
        default:
            ++others
        }
    }
    return (vowels, consonants, others)
}
let total = count("some arbitrary string!")
println("\(total.vowels) vowels and \(total.consonants) consonants")
// prints "6 vowels and 13 consonants
```

###函数参数名称
以上所有的函数都给它们的参数定义了`参数名（parameter name）`：

```
func someFunction(parameterName: Int) {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
}
```
但是，这些参数名仅在函数体中使用，不能在函数调用时使用。这种类型的参数名被称作局部参数名（local parameter name），因为它们只能在函数体中使用。

####外部参数名
有时候，调用函数时，给每个参数命名是非常有用的，因为这些参数名可以指出各个实参的用途是什么。

如果你希望函数的使用者在调用函数时提供参数名字，那就需要给每个参数除了局部参数名外再定义一个外部参数名。外部参数名写在局部参数名之前，用空格分隔

```
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
join(string: "hello", toString: "world", withJoiner: ", ")
// returns "hello, world
```
>如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名

####简写外部参数名
如果你需要提供外部参数名，但是局部参数名已经定义好了，那么你不需要写两次这些参数名。相反，只写一次参数名，并用井号（`#`）作为前缀就可以了。这告诉 Swift 使用这个参数名作为局部和外部参数名

```
func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false
}
let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")
// return true
```

####默认参数值
你可以在函数体中为每个参数定义默认值。当默认值被定义后，调用这个函数时可以略去这个参数

```
func anotherJoin(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}
anotherJoin(string: "hello", toString: "world", withJoiner: "-")
// returns "hello-world
anotherJoin(string: "hello", toString:"world")
// returns "hello world"
```

####可变参数
一个可变参数可以接受一个或多个值。函数调用时，你可以用可变参数来传入不确定数量的输入参数。通过在变量类型名后面加入（`...`）的方式来定义可变参数。

传入可变参数的值在函数体内当做这个类型的一个数组。例如，一个叫做 `numbers` 的 `Double...` 型可变参数，在函数体内可以当做一个叫 `numbers` 的 `[Double]` 型的数组常量

```
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0
arithmeticMean(3, 8, 19)
// returns 10.0
```

####常量参数和变量参数
函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。

但是，有时候，如果函数中有传入参数的变量值副本将是很有用的。你可以通过指定一个或多个参数为变量参数，从而避免自己在函数中定义新的变量。变量参数不是常量，你可以在函数中把它当做新的可修改副本来使用。

通过在参数名前加关键字 `var` 来定义变量参数

```
func alignRight(var string: String, count: Int, pad: String) -> String {
    let amountToPad = count - countElements(string)
    for _ in 1...amountToPad {
        string = pad + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")
```

####输入输出参数
变量参数，正如上面所述，仅仅能在函数体内被更改。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数

定义一个输入输出参数时，在参数定义前加 `inout` 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。

你只能传入一个变量作为输入输出参数。你不能传入常量或者字面量（literal value），因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数前加`&`符，表示这个值可以被函数修改
>输入输出参数不能有默认值，而且变量参数不能用 `inout` 标记。如果你用 `inout` 标记一个参数，这个参数不能用 `var` 或者 `let` 标记

```
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3”
```

###函数类型
每个函数都有种特定的函数类型，由函数的参数类型和返回类型组成

```
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
```
函数的类型是 `(Int, Int) -> Int`，可以读作“这个函数类型，它有两个 `Int` 型的参数并返回一个 `Int` 型的值。”

```
func printHelloWorld() {
    println("hello, world")
}
```
这个函数的类型是：`() -> ()`，或者叫“没有参数，并返回 `Void` 类型的函数。”。没有指定返回类型的函数总返回 `Void`。在Swift中，`Void` 与空的元组是一样的

####使用函数类型
在Swift中，使用函数类型就像使用其他类型一样。例如，你可以定义一个常量或变量，它的类型是函数，并且可以幅值为一个函数

```
var mathFunction: (Int, Int) -> Int = addTwoInts
println("Result: \(mathFunction(2, 3))")
// prints "Result: 5
```

####函数类型作为参数类型
你可以用`(Int, Int) -> Int`这样的函数类型作为另一个函数的参数类型。这样你可以将函数的一部分实现交由给函数的调用者。

```
func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// prints "Result: 8”
```

####函数类型作为返回类型
你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（`->`）后写一个完整的函数类型

```
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
```

###嵌套函数
```
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
```

###函数重载
函数重载是指多个函数享有相同的名字但是函数类型必须不同的一组函数
>在Swift中函数名相同、参数列表不同或返回值类型不同的函数都可以构成重载

```
func receive(i : Int)  {
    println("接收一个Int类型数据 i=\(i)");
}

func receive(d :Double) {
    println("接收一个Doubel类型数据 d=\(d)");
}

func receive(x :Int, y :Int)  {
    println("接收两个Int类型数据 x=\(x) y=\(y)");
}

func receive(i :Int) ->Int {
    println("接收一个Int类型数据 i=\(i), 返回值类型是Int");
    return i;
}

func receive(param i : Int)  {
    println("接收一个Int类型数据 i=\(i)，外部参数名param");
}
```

###泛型函数
```
func isEquals<T: Comparable>(a: T, b: T) -> Bool {
    return (a == b)
}

let n1 = 200
let n2 = 100

println(isEquals(n1, n2))

let s1 = "ABC1"
let s2 = "ABC1"
```