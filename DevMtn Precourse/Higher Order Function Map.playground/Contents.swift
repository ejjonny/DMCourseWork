import Cocoa

//let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//
//
//let doubledNumbers = numbers.map{ (a) -> Int in
//    return numbers[a-1]*2
//}
//print(doubledNumbers)

var students = ["Brendan": 1994, "James": 1990, "Sarah": 2001, "Lear": 1993, "Sam": 1999]

let studentsNames = students.map{$0.key}

print(studentsNames)

let numbers = [1,2,3,4]

let newNumbers = numbers.map{$0 * 2}

print(newNumbers)
