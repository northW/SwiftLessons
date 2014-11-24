#Lesson3
##1.枚举
在C和Objcetive-C中，枚举用来管理一组相关常亮集合，通过使用枚举可以提高程序的可读性，使代码更清晰，更易于维护。而在Swift中，枚举还具有了面向对象的特征。  

枚举定义了一个通用类型的一组相关的值，使你可以在你的代码中以一个安全的方式来使用这些值。

如果你熟悉 C 语言，你就会知道，在 C 语言中枚举指定相关名称为一组整型值。Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。如果一个值（被认为是“原始”值）被提供给每个枚举成员，则该值可以是一个字符串，一个字符，或是一个整型值或浮点值。

此外，枚举成员可以指定任何类型的实例值存储到枚举成员值中，就像其他语言中的联合体（unions）和变体（variants）。你可以定义一组通用的相关成员作为枚举的一部分，每一组都有不同的一组与它相关的适当类型的数值。

###枚举的声明
```
enum SomeEumeration {
    // enumeration definition goes here
}
```
枚举声明示例：

```
enum WeekDays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
```
或简写成：

```
enum WeekDays {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}
```

###匹配枚举值和Switch语句
```
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
```
当匹配了枚举对象的所有成员时，`switch`中得`default`语句可以省略

###原始值（Raw Values）
枚举成员可以被默认值（称为原始值）预先填充，其中这些原始值具有相同的类型。

```
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
```
原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。当整型值被用于原始值，如果其他枚举成员没有值时，它们会自动递增。

```
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
```
自动递增意味着Planet.Venus的原始值是2，依次类推。
####访问枚举成员的原始值
```
let earthsOrder = Planet.Earth.rawValue
```
####找到具有特定原始值的枚举成员
```
let possiblePlanet = Planet(rawValue: 7)
```

###相关值（Associated Values）
在Swift中除了可以定义一组成员值，还可以定义一组相关值，她有点类似C中得联合类型。

```
enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}
```
枚举类型`Figure`有两个相关值：`Rectangle`和`Circle`。`Rectangle`和`Circle`是与`Figure`有关联的相关值，对于一个特定的`Figure`实例，只能是其中一个相关值。

```
func printFigure(figure : Figure) {
    
    switch figure {
    case .Rectangle(let width, let height):
        println("矩形的宽:\(width) 高:\(height)")
    case .Circle(let radius):
        println("圆形的半径：\(radius)")
    }
    
}


var figure = Figure.Rectangle(1024, 768)
printFigure(figure)

figure = .Circle(600)
printFigure(figure)
```
##2.类和结构体
类和结构体是人们构建代码所用的一种通用且灵活的构造体。为了在类和结构体中实现各种功能，我们必须要严格按照对于常量，变量以及函数所规定的语法规则来定义属性和添加方法
###类和结构体对比
Swift 中类和结构体有很多共同点。共同处在于

* 定义属性用于储存值
* 定义方法用于提供功能
* 定义下标用于通过下标语法访问值
* 定义初始化器用于生成初始化值
* 通过扩展以增加默认实现的功能
* 符合协议以对某类提供标准功能

与结构体相比，类还有如下的附加功能：

* 继承允许一个类继承另一个类的特征
* 类型转换允许在运行时检查和解释一个类实例的类型
* 取消初始化器允许一个类实例释放任何其所被分配的资源
* 引用计数允许对一个类的多次引用 

###定义
类和结构体有着类似的定义方式。我们通过关键字`class`和`struct`来分别表示类和结构体，并在一对大括号中定义它们的具体内容：

```
class SomeClass {
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}
```

定义结构体和定义类的示例：

```
struct Resolution {
    var width = 0
    var heigth = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
```

在上面的示例中我们定义了一个名为`Resolution`的结构体，用来描述一个显示器的像素分辨率。这个结构体包含了两个名为`width`和`height`的储存属性。储存属性是捆绑和储存在类或结构体中的常量或变量 
 
在上面的示例中我们还定义了一个名为`VideoMode`的类，用来描述一个视频显示器的特定模式。这个类包含了四个储存属性变量。第一个是分辨率，它被初始化为一个新的`Resolution`结构体的实例，具有`Resolution`的属性类型。新`VideoMode`实例同时还会初始化其它三个属性，它们分别是，初始值为`false`的`inteflaced`，回放帧率初始值为`0.0`的`frameRate`和值为可选`String`的`name`。`name`属性会被自动赋予一个默认值`nil`，意为“没有`name`值”，因它是一个可选类型

###类和结构体实例
`Resolution`结构体和`VideoMode`类的定义仅描述了什么是`Resolution`和`VideoMode`。它们并没有描述一个特定的分辨率（resolution）或者视频模式（video mode）。为了描述一个特定的分辨率或者视频模式，我们需要生成一个它们的实例

```
let someResolution = Resolution()
let someVideoMode = VideoMode()
```

###属性访问
通过使用点语法（dot syntax）,你可以访问实例中所含有的属性。其语法规则是，实例名后面紧跟属性名，两者通过点号(.)连接

```
println("The width of someResolution is \(someResolution.width)")
// 输出 "The width of someResolution is 0"
```

你也可以访问子属性，如何`VideoMode`中`Resolution`属性的`width`属性

```
println("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 输出 "The width of someVideoMode is 0"
```
也可以使用点语法为属性变量赋值：

```
someVideoMode.resolution.width = 12880
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 输出 "The width of someVideoMode is now 1280"
```

###结构体类型的成员逐一初始化器
所有结构体都有一个自动生成的成员逐一初始化器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一初始化器之中

```
let vga = Resolution(width: 640, heigth: 480)
```
与结构体不同，类实例没有默认的成员逐一初始化器

###结构体和枚举是值类型
值类型被赋予给一个变量，常数或者本身被传递给一个函数的时候，实际上操作的是其的拷贝。

在 Swift 中，所有的结构体和枚举都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制

```
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
println("cinema is now  \(cinema.width) pixels wide")
// 输出 "cinema is now 2048 pixels wide"
println("hd is still \(hd.width) pixels wide")
// 输出 "hd is still 1920 pixels wide"
```
枚举也遵循相同的行为准则

```
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    println("The remembered direction is still .West")
}
// 输出 "The remembered direction is still .West"
```
###类是引用类型
与值类型不同，引用类型在被赋予到一个变量，常量或者被传递到一个函数时，操作的并不是其拷贝。因此，引用的是已存在的实例本身而不是其拷贝

```
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// 输出 "The frameRate property of theEighty is now 30.0"
```

####类和结构体的选择
在你的代码中，你可以使用类和结构体来定义你的自定义数据类型。

然而，结构体实例总是通过值传递，类实例总是通过引用传递。这意味两者适用不同的任务。当你的在考虑一个工程项目的数据构造和功能的时候，你需要决定每个数据构造是定义成类还是结构体。

按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：

* 结构体的主要目的是用来封装少量相关简单数据值。
* 有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
* 任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
* 结构体不需要去继承另一个已存在类型的属性或者行为。

合适的结构体候选者包括：

* 几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
* 一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
* 三维坐标系内一点，封装x，y和z属性，三者均为Double类型。

在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。

##3.属性
属性将值跟特定的类、结构或枚举关联。存储属性存储常量或变量作为实例的一部分，计算属性计算（而不是存储）一个值。计算属性可以用于类、结构体和枚举里，存储属性只能用于类和结构体。

存储属性和计算属性通常用于特定类型的实例，但是，属性也可以直接用于类型本身，这种属性称为类型属性。

另外，还可以定义属性监视器来监控属性值的变化，以此来触发一个自定义的操作。属性监视器可以添加到自己写的存储属性上，也可以添加到从父类继承的属性上

###存储属性
简单来说，一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量，存储属性可以是变量存储属性（用关键字`var`定义），也可以是常量存储属性（用关键字`let`定义）

```
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
```

####延迟存储属性
延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用`lazy`来标示一个延迟存储属性
>必须将延迟存储属性声明成变量（使用`var`关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。

延迟属性很有用，当属性的值依赖于在实例的构造过程结束前无法知道具体值的外部因素时，或者当属性的值需要复杂或大量计算时，可以只在需要的时候来计算它

下面的例子使用了延迟存储属性来避免复杂类的不必要的初始化。例子中定义了`DataImporter`和`DataManager`两个类

```
class DataImporter {
    /*
    DataImporter 是一个将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这是提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这是提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建

println(manager.importer.fileName)
// DataImporter 实例的 importer 属性现在被创建了
// 输出 "data.txt”
```

###计算属性
除存储属性外，类、结构体和枚举可以定义计算属性，计算属性不直接存储值，而是提供一个 `getter` 来获取值，一个可选的 `setter` 来间接设置其他属性或变量的值

```
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
println("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 输出 "square.origin is now at (10.0, 10.0)”
```

####便捷 setter 声明
如果计算属性的 `setter` 没有定义表示新值的参数名，则可以使用默认名称`newValue`。

```
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
```

####只读计算属性
只有 `getter` 没有 `setter` 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
> 必须使用`var`关键字定义计算属性，包括只读计算属性，因为他们的值不是固定的。`let`关键字只用来声明常量属性，表示初始化后再也无法修改的值。

```
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 输出 "the volume of fourByFiveByTwo is 40.0"
```

###属性监视器
属性监视器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性监视器，甚至新的值和现在的值相同的时候也不例外。

可以为属性添加如下的一个或全部监视器：

* `willSet`在设置新的值之前调用
* `didSet`在新的值被设置之后立即调用

可以为属性添加如下的一个或全部监视器：

* willSet在设置新的值之前调用
* didSet在新的值被设置之后立即调用

`willSet`监视器会将新的属性值作为固定参数传入，在`willSet`的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称`newValue`表示。

类似地，`didSet`监视器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名`oldValue`

> `willSet`和`didSet`监视器在属性初始化过程中不会被调用，他们只会当属性的值在初始化之外的地方被设置时被调用。

```
class Employee {
    var name : String = "Tony" {
        willSet(newNameValue) {
            println("员工name新值：\(newNameValue)")
        }
        didSet {
            println("员工name旧值：\(oldValue)")
        }
    }
}
var emp = Employee()
emp.name = "Smith"
```

###类型属性
实例的属性属于一个特定类型实例，每次类型实例化后都拥有自己的一套属性值，实例之间的属性相互独立。

也可以为类型本身定义属性，不管类型有多少个实例，这些属性都只有唯一一份。这种属性就是类型属性或静态属性。

类型属性用于定义特定类型所有实例共享的数据，比如所有实例都能用的一个常量，或者所有实例都能访问的一个变量

对于值类型（指结构体和枚举）可以定义存储型和计算型类型属性，对于类则只能定义计算型类型属性。

值类型的存储型类型属性可以是变量或常量，计算型类型属性跟实例的计算属性一样定义成变量属性

> 跟实例的存储属性不同，必须给存储型类型属性指定默认值，因为类型本身无法在初始化过程中使用构造器给类型属性赋值。

####类型属性语法
使用关键字`static`来定义值类型的类型属性，关键字`class`来为类定义类型属性。

```
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 10
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 10
    }
}
class SomeClass {
    class var computedTypeProperty: Int {
        return 10
    }
}
```
> 例子中的计算型类型属性是只读的，但也可以定义可读可写的计算型类型属性，跟实例计算属性的语法类似。

####获取和设置类型属性的值
跟实例的属性一样，类型属性的访问也是通过点运算符来进行，但是，类型属性是通过类型本身来获取和设置，而不是通过实例

```
println(SomeClass.computedTypeProperty)
// 输出 "10"

println(SomeStructure.storedTypeProperty)
// 输出 "Some value."
SomeStructure.storedTypeProperty = "Another value."
println(SomeStructure.storedTypeProperty)
// 输出 "Another value.”

println(SomeClass.computedTypeProperty)
// 输出 "10"
```

###附属脚本(使用下标)
附属脚本 可以定义在类、结构体和枚举这些目标中，可以认为是访问对象、集合或序列的快捷方式，不需要再调用实例的特定的赋值和访问方法。举例来说，用附属脚本访问一个数组(`Array`)实例中的元素可以这样写 `someArray[index]` ，访问字典(`Dictionary`)实例中的元素可以这样写 `someDictionary[key]`。

####附属脚本语法
附属脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。语法类似于实例方法和计算型属性的混合

```
subscript(index: Int) -> Int {
    get {
        // 返回与入参匹配的Int类型的值
    }

    set(newValue) {
        // 执行赋值操作
    }
}
```

`newValue`的类型必须和附属脚本定义的返回类型相同。与计算型属性相同的是`set`的入参声明`newValue`就算不写，在`set`代码块中依然可以使用默认的`newValue`这个变量来访问新赋的值

####附属脚本用法
下列代码实现了一个二维数组

```
struct DoubleDimensionalArray {
    
    let rows: Int, columns: Int
    var grid: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    
    subscript(row: Int, col: Int) -> Int {
        
        get {
            return grid[(row * columns) + col]
        }
        
        set (newValue1){
            grid[(row * columns) + col] = newValue1
        }
    }
    
}

var ary2 = DoubleDimensionalArray(rows: 10, columns: 10)

for var i = 0; i < 10; i++ {
    for var j = 0; j < 10; j++ {
        ary2[i,j] = i * j
    }
}
```

###Swift面向对象类型属性

| 面向对象类型 | 实例存储属性 | 静态存储属性 | 实例计算属性 | 静态计算属性 |
| :--------: | :--------: | :--------: | :--------: | :--------: |
| 类         | 支持        | 不支持      | 支持        | 支持        |
| 结构体      | 支持        | 支持        | 支持        | 支持        |
| 枚举       | 不支持       | 支持        | 支持        | 支持        |


##4.方法
方法是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型方法；类型方法与类型本身相关联。

###实例方法
实例方法是属于某个特定类、结构体或者枚举类型实例的方法。实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。

实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。实例方法只能被它所属的类的某个特定实例调用。实例方法不能脱离于现存的实例而被调用。

```
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
```
和调用属性一样，用点语法（dot syntax）调用实例方法：

```
 let counter = Counter()
 // 初始计数值是0
 counter.increment()
 // 计数值现在是1
 counter.incrementBy(5)
 // 计数值现在是6
 counter.reset()
 // 计数值现在是0
```

####方法的局部参数名称和外部参数名称
函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用）

但是，方法和函数的局部名称和外部名称的默认行为是不一样的。方法默认把局部参数名作为外部参数名，在函数中需要在本地参数名前加“`#`”，而方法不需要。

```
class Counter {
  var count: Int = 0
  func incrementBy(amount: Int, numberOfTimes: Int) {
    count += amount * numberOfTimes
  }
}
let counter = Counter()
counter.incrementBy(5, numberOfTimes: 3)
// counter value is now 15
```

####结构体和枚举的方法变异
结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。

但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异(`mutating`)这个方法

```
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
```

###类型方法
实例方法是被类型的某个实例调用的方法。你也可以定义类型本身调用的方法，这种方法就叫做类型方法。声明类的类型方法，在方法的`func`关键字之前加上关键字`class`；声明结构体和枚举的类型方法，在方法的`func`关键字之前加上关键字`static`

```
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
```