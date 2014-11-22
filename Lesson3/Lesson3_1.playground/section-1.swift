// Playground - noun: a place where people can play

import UIKit

//enum WeekDays {
//    case Monday
//    case Tuesday
//    case Wednesday
//    case Thursday
//    case Friday
//}

enum WeekDays {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}

var day  = WeekDays.Friday

switch day {
case .Monday:
    println("星期一好！")
case .Tuesday :
    println("星期二好！")
case .Wednesday :
    println("星期三好！")
case .Thursday :
    println("星期四好！")
case .Friday :
    println("星期五好！")
}


// 原始值
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = Planet.Earth.rawValue

let possiblePlanet = Planet(rawValue: 7)

// 相关值
enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}

func printFigure(figure : Figure) {
    
    switch figure {
    case let .Rectangle( width, height):
        println("矩形的宽:\(width) 高:\(height)")
    case .Circle(let radius):
        println("圆形的半径：\(radius)")
    }
    
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure)

figure = .Circle(600)
printFigure(figure)