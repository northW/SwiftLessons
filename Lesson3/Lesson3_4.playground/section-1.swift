// Playground - noun: a place where people can play

import UIKit

class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}


let counter = Counter()
// 初始计数值是0
counter.increment()
// 计数值现在是1
counter.incrementBy(5)
// 计数值现在是6
counter.reset()
// 计数值现在是0


class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}
let counter2 = Counter2()
counter2.incrementBy(5, numberOfTimes: 3)
// counter value is now 15

// 结构体和枚举的方法变异
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
println("The point is now at (\(somePoint.x), \(somePoint.y))")
// 输出 "The point is now at (3.0, 4.0)"


// 类型方法
// 结构体中静态方法
struct Account {
    
    var owner : String = "Tony"                 //账户名
    static var interestRate : Double = 0.668    //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
    
    func messageWith(amount : Double) -> String {
        
        var interest = Account.interestBy(amount)
        return "\(self.owner) 的利息是\(interest)"
        
    }
}

//调用静态方法
println(Account.interestBy(10_000.00))

var myAccount = Account()
//调用实例方法
println(myAccount.messageWith(10_000.00))

// 枚举中静态方法
enum Bank {
    
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate : Double = 0.668 //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}

//调用静态方法
println(Bank.interestBy(10_000.00 ))

// 类中静态方法
class Account2 {
    
    var owner : String = "Tony"                 //账户名
    
    class func interestBy(amount : Double) -> Double {
        println(self)
        return 0.8886 * amount
    }
}

//调用静态方法
println(Account2.interestBy(10_000.00 ))