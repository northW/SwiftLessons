// Playground - noun: a place where people can play

import UIKit
var a = ""

// 整型
println("UInt8 range: \(UInt8.min) ~ \(UInt8.max)")
println("Int8 range: \(Int8.min) ~ \(Int8.max)")

println("UInt16 range: \(UInt16.min) ~ \(UInt16.max)")
println("Int16 range: \(Int16.min) ~ \(Int16.max)")

println("UInt32 range: \(UInt32.min) ~ \(UInt32.max)")
println("Int32 range: \(Int32.min) ~ \(Int32.max)")

println("UInt64 range: \(UInt64.min) ~ \(UInt64.max)")
println("Int64 range: \(Int64.min) ~ \(Int64.max)")

println("UInt range: \(UInt.min) ~ \(UInt.max)")
println("Int range: \(Int.min) ~ \(Int.max)")

// 自动推断类型为Int
var i = 30
// 已经推断为Int类型的变量不能再赋值为其他类型
//i = "hello" // 注意，会发生编译错误


// 浮点型
var f1:Float = 10.0
var f2:Double = 10.0
var f3:Float = 10 // 10.0
let pi = 3.14159 // 自动推断为Double类型

// 进制数
let decimaInt = 28
let binaryInt = 0b11100   // 二进制
let octalInt = 0o34       // 八进制
let hexadecimalInt = 0x1C // 十六进制

// 指数
var e1 = 3.36e2    // 336.0
var e2 = 3.36E2    // 336.0
var e3 = 1.56e-2   // 0.0156

var p1 = 0x10p2    // 64.0 这个怎么换算的我也不知道。。

// 其他表示
var rate = 000.0156       // 0.0156
var myMoney = 10_000_000  // 10,000,000

// 整型之间的转换
let historyScore:UInt8 = 90
let englishScore:UInt16 = 130

//var totalScore1 = historyScore + englishScore // 错误              ①
var totalScore2 = UInt16(historyScore) + englishScore // 正确        ②
var totalScore3 = historyScore + UInt8(englishScore)  // 正确 不安全  ③

let mathScore:UInt16 = 1300
//var totalScore4 = historyScore + UInt8(mathScore) // 运行时异常

// 整型和浮点型之间的转换
let score1:Float = 90.5
let score2:UInt16 = 130

//let totalScore4 = score1 + score2        // 错误                 ①
let totalScore5 = score1 + Float(score2)   // 正确 安全             ②
let totalScore6 = UInt16(score1) + score2  // 正确 小数被裁掉 不安全  ③

// 布尔型
var isTrue = true
var isFalse:Bool = false
