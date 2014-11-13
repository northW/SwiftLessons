// Playground - noun: a place where people can play

import UIKit

var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
sort(&names, backwards)
// names 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

sort(&names, { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
println(names)

sort(&names, { (s1: String, s2: String) -> Bool in return s1 > s2 })
println(names)

sort(&names, { s1, s2 in
    return s1 > s2
})
println(names)

sort(&names, { return $0 > $1 } )
println(names)

sort(&names, >)
println(names)

sort(&names){ return $0 > $1 }



func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
// 返回的值为10
incrementByTen()
// 返回的值为20
incrementByTen()
// 返回的值为30

let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
// 返回的值为7
incrementByTen()
// 返回的值为40