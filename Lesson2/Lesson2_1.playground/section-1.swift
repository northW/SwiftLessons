// Playground - noun: a place where people can play

import UIKit

// ---------
// 条件语句if
// ---------
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
}
// 输出 "It's very cold. Consider wearing a scarf."

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's not that cold. Wear a t-shirt."

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    println("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    println("It's really warm. Don't forget to wear sunscreen.")
} else {
    println("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's really warm. Don't forget to wear sunscreen."


// ---------
// switch语句
// ---------

// 数值的匹配，下面的整数也可以换成浮点数
var testScore = 86
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

// 每一个 case 分支都必须包含至少一条语句。像下面这样书写代码是无效的，因为第一个 case 分支是空的
//let anotherCharacter: Character = "a"
//switch anotherCharacter {
//case "a":
//case "A":
//    println("The letter A")
//default:
//    println("Not the letter A")
//}
// this will report a compile-time error

// 使用范围匹配
testScore = 86
switch testScore {
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

// 使用元组类型
var student = (id:"1002", name:"李四", age:32, ChineseScore:90, EnglishScore:91)

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

// 元组类型·值绑定
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

// 元组类型·where语句
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

// ---------
// 循环语句
// ---------

// while语句
var i = 0

while i * i < 100000 {
    i++
}

println("i = \(i)")
println("i * i = \(i * i)")


// do while语句
do{
    i++
} while  i * i < 100000

println("i = \(i)")
println("i * i = \(i * i)")

// for语句
for var index = 0; index < 3; ++index {
    println("index is \(index)")
}
// index is 0
// index is 1
// index is 2

// for in语句
// 区间的循环
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// 遍历一个数组所有元素
let names = ["Anna", "Alex"]
for name in names {
    println("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!

// 遍历字典
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}
// spiders have 8 legs
// ants have 6 legs
// cats have 4 legs

// 遍历字符串中的字符
for character in "Hello" {
    println(character)
}
// H
// e
// l
// l
// o

// ---------
// 跳转语句
// ---------

// continue
let numbers = [1, 2, 3, 4, 5]

for var i = 0; i < countElements(numbers); i++
{
    if i == 3 {
        continue
    }
    println("Count is: \(i)")
}

// 带标签的continue
label1: for var x = 0; x < 3; x++ {
    
    label2: for var y = 3; y > 0; y-- {
        if y == x {
            continue label1
        }
        println("(x,y) = (\(x),\(y))")
    }
}

// break
for var i = 0; i < countElements(numbers); i++
{
    if i == 3 {
        break
    }
    println("Count is: \(i)")
}

label1: for var x = 0; x < 3; x++ {
    
    label2: for var y = 3; y > 0; y-- {
        if y == x {
            break label1
        }
        println("(x,y) = (\(x),\(y))")
    }
}

// fallthrough
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
