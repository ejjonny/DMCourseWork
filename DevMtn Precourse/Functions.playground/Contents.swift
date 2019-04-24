import Cocoa

//func printPersonalGreetings(to names: String...) {
//    for name in names {
//        print("Hello \(name), welcome to your playground.")
//    }
//}
//printPersonalGreetings(to: "Alex", "Juanita", "Sanchez", "Panto")

//func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String {
//    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
//}
//print(divisionDescriptionFor(numerator: 9.0, denominator: 3.0, withPunctuation: "!"))

//var error = "The request failed:"
//func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
//    if code == 400 {
//        errorString += " bad request."
//    }
//}
//appendErrorCode(400, toErrorString: &error)
//print(error)

//func areaOfTriangleWith(base: Double, height: Double) -> Double {
//    let numerator = base * height
//    func divide() -> Double {
//        return numerator / 2
//    }
//    return divide()
//}
//areaOfTriangleWith(base: 3.0, height: 5.0)

//func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
//    var evens = [Int]()
//    var odds = [Int]()
//    for number in numbers {
//        if number % 2 == 0 {
//            evens.append(number)
//        } else {
//            odds.append(number)
//        }
//    }
//    return (evens, odds)
//}
//
//print(sortedEvenOddNumbers([2,5,4,6,7,2,4,7,4]))

//func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
//    return name.1
//}
//
//let middleName = grabMiddleName(fromFullName: ("Matt", nil, "Mathias"))
//if let theName = middleName {
//    print(theName)
//}

//func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
//    guard let middleName = name.middle, middleName.count < 4 else {
//        print("Hey there!")
//        return
//    }
//    print("Hey \(middleName)")
//}
//greetByMiddleName(fromFullName: ("Matt", "Dick", "Mathias"))

//var myGroceryList = ["dick beans", "ass beans", "tit beans", "salsa", "guac"]
//
//func siftBeans(fromGroceryList List: [String]) -> (beans: [String], otherGroceries: [String]) {
//    var beans = [String]()
//    var otherGroceries = [String]()
//    for grocery in List {
//        if grocery.hasSuffix("beans") {
//            beans.append(grocery)
//        } else {
//            otherGroceries.append(grocery)
//        }
//    }
//
//    return(beans, otherGroceries)
//}
//
//let result = siftBeans(fromGroceryList: myGroceryList)


