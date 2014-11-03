// Playground - noun: a place where people can play

import UIKit

// 一元运算符
var a = 12
println(-a)

var b = a++
println(b)

b = ++a
println(b)


// 二元运算符

// 声明一个整形变量
var intValue = 1 + 2
println(intValue)

intValue = intValue - 1
println(intValue)

intValue = intValue * 2
println(intValue)

intValue = intValue / 2
println(intValue)

intValue = intValue + 8
intValue = intValue % 7
println(intValue)

// 声明一个浮点变量
var doubleValue = 10.0
println(doubleValue)

doubleValue = doubleValue - 1
println(doubleValue)

doubleValue = doubleValue * 2
println(doubleValue)

doubleValue = doubleValue / 2
println(doubleValue)

doubleValue = doubleValue + 8
doubleValue = doubleValue % 7
println(doubleValue)

// 关系运算符
// Int
var v1 = 1 , v2 = 2
if v1 == v2 {
    println("v1 == v2")
}
if v1 != v2 {
    println("v1 != v2")
}
if v1 > v2 {
    println("v1 > v2")
}
if v1 < v2 {
    println("v1 < v2")
}
if v1 <= v2 {
    println("v1 <= v2")
}
if v1 >= v2 {
    println("v1 >= v2")
}

// 字符串
let name1 = "world"
let name2 = "world"
if name1 == name2 {
    println("name1 == name2")
}

// 引用类型之外的类型不能使用===
//if v1 === v2 {
//    println("v1 === v2")
//}

//if n1 === n2 {
//    println("n1 === n2")
//}

// 数组
let arr1 = [1,2]
let arr2 = [1,2]
if arr1 == arr2 {
    println("arr1 == arr2")
}
//if arr1 === arr2 {
//    println("arr1 === arr2")
//}

// 逻辑运算
var i = 0,j=10, k = 9
if(j > k) || (i++ == 1){
    println("逻辑与为 true")
    println("i = \(i)")
}
if(j > k) | (i++ == 1){
    println("逻辑与为 true")
    println("i = \(i)")
}

// 位运算符
let Ob1:UInt8 = 0b10110010
let Ob2:UInt8 = 0b01011110

println("a | b = \(Ob1|Ob2)") // 11111110
println("a & b = \(Ob1&Ob2)") // 00010010
println("a ^ b = \(Ob1^Ob2)") // 11101100
println("~a = \(~Ob1)") // 01001101

println("a >> 2 = \(Ob1>>2)") // 00101100
println("a << 2 = \(Ob1<<2)") // 11001000


