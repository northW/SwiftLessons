// Playground - noun: a place where people can play

import UIKit

var str = "Hello, world."
println(str)

// Unicode支持的字符集都可以作为标示符
var 😄 = "I'm happy"
println(😄)

println(str + 😄)

// 如想使用关键字作为标示符，使用（`）
var `class` = "I'm a string" // 不推荐使用关键字声明标示符
println(`class`)

// 标示符是区分大小写的
var Class = "I'm a string too"
println(Class)

// 声明常量
let _Hello = "Hello"

// 企图再次给常量赋值会报错
//_Hello = "ops"

// 声明变量
// 一次可以声明多个变量，也可以指定不同的数据类型
var x = 10 , y = "a", z = true
x = 20
println(x)

// 再次赋值时如果和声明时的数据类型不同时会报错
//y = 30

//println(x+y)



if x > 20 {
    // 单行注释
} else {
    /*
      多行注释
    */
}

// 不指定数据类型，swift会自动推断数据类型
var a1 = 10
let a2 = 20
var a = a1 > a2 ? a1 : a2

// 指定数据类型，这样会使程序的可读性更好，推荐
var b1:Int = 10
let b2:Int = 20
var b:Int = b1 > b2 ? b1 : b2