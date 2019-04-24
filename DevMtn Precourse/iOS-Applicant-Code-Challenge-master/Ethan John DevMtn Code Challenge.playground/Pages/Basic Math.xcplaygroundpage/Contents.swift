/*:
## Basic Math

Demonstrate basic knowledge of functions that take parameters and return results by implementing some basic math functions.
*/
//: Write a function that returns the sum of two numbers
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
//: Write a function that returns the product of two numbers

func productOf (numbers: Int...) -> Int {
    var product = 1
    for number in numbers {
        product *= number
    }
    return product
}
//: Write a function that returns the average (mean) of an array of numbers

func averageOf (numbers: [Int]) -> Int {
    var average = 0
    for number in numbers {
        average += number
    }
    average = average/numbers.count
    return average
}
//: Demo the use of your functions here:
sumOf(numbers: 10, 5)

productOf(numbers: 10, 5)

averageOf(numbers: [30, 300])

//: [Previous](@previous)
//: [Next](@next)
