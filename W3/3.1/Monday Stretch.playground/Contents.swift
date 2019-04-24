import UIKit

//Instructions from your teacher:
//Use filter to create an array that contains all the numbers that are multiples of 3 from the array [11,23,43,44,59,43,88,92,58,11,13,14,15]. Print your result
//Find the largest number from the previous number array and then print it. Use reduce to solve. Print your result.
//Join all the string objects in ["I", "Love", "Dev Mountain"] into one string using reduce. Make sure spaces are in between each string. Print your result.
//
//♦ Black Diamond
//In one line convert [["Mama": "too cold", "Papa": "too hot", "Baby": "just right"]] into an array with only one element that contains a string describing Mama, Papa, and Baby bear's porridge temperature. FlatMap, reduce, and anonymous closure arguments will be your friend. 


let data = [15,23,43,30,59,43,88,92,58,11,13,14,15]

let multiplesOfThree = data.filter { $0 % 3 == 0 ? true : false }

print(multiplesOfThree)

let largestNumber = data.reduce(0) { $0 > $1 ? $0 : $1}

print(largestNumber)

let stringArray = ["I", "Love", "Dev Mountain"]

print(stringArray.reduce("") { $0 + $1 + " "})

let bears = [["Mama": "too cold", "Papa": "too hot", "Baby": "just right"]]

print(bears.flatMap{ $0 })
//print(bears.flatMap{ $0.reduce(""){ $0.0 + $0.1}})
