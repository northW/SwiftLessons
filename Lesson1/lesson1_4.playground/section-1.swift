// Playground - noun: a place where people can play

import UIKit

// 字符

let andSign1:Character = "&"
//let andSign2:Character = "\x26"
//println("andSign1 == andSign2\(andSign1 == andSign2)")


let lamda1:Character = "λ"
let lamda2 = "\u{03bb}"

let smile1:Character = "a"
//let smile2 = "\U0001ff603"

// 字符串
let str = "I'm a String"
println("str的长度：\(countElements(str))")

let 熊 = "🐻"
let 猫 = "🐱"
let 🐼 = 熊+猫

let emptyString1 = ""
let emptyString2 = String()


// 字符串比较
if 熊 > 猫 {
    println("\(熊) > \(猫)")
} else {
    println("\(熊) < \(猫)")
}

if emptyString1 == emptyString2 {
    println("相等")
} else {
    println("不相等")
}

// 前缀和后缀比较
let file = "JAVA.doc"

let lowercase = file.lowercaseString

if lowercase.hasPrefix("java"){
    println("JAVA.doc 和java相关")
}

if lowercase.hasSuffix(".doc"){
    println("JAVA.doc 是.doc文档")
}