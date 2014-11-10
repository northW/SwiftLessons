// Playground - noun: a place where people can play

import UIKit

var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList2 = ["Eggs", "Milk"]
var shoppingList3 = [String]()

// ---------
// 数组
// ---------

// 访问数组个数
println("The shopping list contains \(shoppingList.count) items.")
// 输出"The shopping list contains 2 items."

println("The shopping list contains \(countElements(shoppingList)) items.")
// 输出"The shopping list contains 2 items."

// 访问是否为空
if shoppingList.isEmpty {
    println("The shopping list is empty.")
} else {
    println("The shopping list is not empty.")
}
// 打印 "The shopping list is not empty."

// 添加数据项
shoppingList.append("Flour")
println(shoppingList)
shoppingList += ["Cheese", "Butter"]
println(shoppingList)

// 通过下标来访问和修改数组中的数据项
println(shoppingList[0])
// Eggs
shoppingList[0] = "Chocolate"
println(shoppingList[0])
// Chocolate
shoppingList[2...4] = ["Bananas", "Apples"]
println(shoppingList)
// ["Chocolate", "Milk", "Bananas", "Apples"]


// 通过方法修改数组中的数据项
shoppingList.insert("Cake", atIndex:1)
println(shoppingList)
var item = shoppingList.removeAtIndex(1)
println(shoppingList)
var last = shoppingList.removeLast()
println(shoppingList)

// 数组的遍历
for item in shoppingList {
    println(item)
}
for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1): \(value)")
}

// repeatedValue
var threeDoubles = [Double](count: 3, repeatedValue:0.0)
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

// ---------
// 字典
// ---------

var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
var airports2 = ["TYO": "Tokyo", "DUB": "Dublin"]
var emptyDiction = Dictionary<String, String>()

println("The dictionary of airports contains \(airports.count) items.")
// 打印 "The dictionary of airports contains 2 items."

airports["LHR"] = "London"
println(airports)
// airports 字典现在有三个数据项

airports["LHR"] = "London Heathrow"
println(airports)
// "LHR"对应的值 被改为 "London Heathrow

if let oldValue = airports.updateValue("Dublin Internation", forKey: "DUB") {
    println("The old value for DUB was \(oldValue).")
}
println(airports)
// 输出 "The old value for DUB was Dublin."（dub原值是dublin

if let airportName = airports["DUB"] {
    println("The name of the airport is \(airportName).")
} else {
    println("That airport is not in the airports dictionary.")
}
println(airports)
// 打印 "The name of the airport is Dublin INTernation."

airports["APL"] = "Apple Internation"
println(airports)
// "Apple Internation"不是真的 APL机场, 删除它

airports["APL"] = nil
println(airports)
// APL现在被移除了

if let removedValue = airports.removeValueForKey("DUB") {
    println("The removed airport's name is \(removedValue).")
} else {
    println("The airports dictionary does not contain a value for DUB.")
}
println(airports)
// prints "The removed airport's name is Dublin International."



// 字典遍历
for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}
// TYO: Tokyo
// LHR: London Heathrow

for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}
for airportName in airports.values {
    println("Airport name: \(airportName)")
}
let airportCodes = Array(airports.keys)
// airportCodes is ["TYO", "LHR"]

let airportNames = Array(airports.values)
// airportNames is ["Tokyo", "London Heathrow"]

// 清空字典
airports = [:]
println(airports)

// 字典的复制
var students = [101:"Tom",102:"Jerry"]
var copyStudents = students
copyStudents[101] = "Tomy"
println(students)
println(copyStudents)



