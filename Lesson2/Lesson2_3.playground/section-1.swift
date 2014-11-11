// Playground - noun: a place where people can play

import UIKit

func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}
println(sayHello("Anna"))
// prints "Hello, Anna!"


// 多重输入参数
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
println(halfOpenRangeLength(1, 10))
// prints "9

// 无参函数
func sayHelloWorld() -> String {
    return "hello, world"
}
println(sayHelloWorld())
// prints "hello, world


// 无返回值函数
func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!

func sayGoodbye2(personName: String) -> () {
    println("Goodbye, \(personName)!")
}

// 多重返回值函数
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


// 外部参数名
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
join(string: "hello", toString: "world", withJoiner: ", ")
// returns "hello, world


// 简写外部参数名
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

// 默认参数值
func anotherJoin(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}
anotherJoin(string: "hello", toString: "world", withJoiner: "-")
// returns "hello-world
anotherJoin(string: "hello", toString:"world")
// returns "hello world"

// 可变参数
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

// 常量参数和变量参数
func alignRight(var string: String, count: Int, pad: String) -> String {
    let amountToPad = count - countElements(string)
    for _ in 1...amountToPad {
        string = pad + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")


// 输入输出参数
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


// 函数类型
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
println("Result: \(mathFunction(2, 3))")
// prints "Result: 5

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// prints "Result: 8”

// 函数类型作为返回类型
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

// 嵌套函数
func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(currentValue2 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue2 != 0 {
    println("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}

// 函数重载
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


let a1:Int = receive(10)
let a2:() = receive(10)
let a3:Void = receive(10)
let a4:() = receive(10.0)
let a5:() = receive(10, 10)
let a6:() = receive(param: 10)


// 泛型函数
func isEquals<T: Comparable>(a: T, b: T) -> Bool {
    return (a == b)
}

let n1 = 200
let n2 = 100

println(isEquals(n1, n2))

let s1 = "ABC1"
let s2 = "ABC1"

println(isEquals(s1, s2))