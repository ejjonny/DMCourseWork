import UIKit

//
//Create a function that takes an Int as a parameter and prints it to the console the way an old-school alarm clock would look. You may create auxiliary functions if needed.
//
//For example, if you pass 257 the console might look something like this:
//
//---   ---  ---
//| |        |
//---   ---     |
//|         |    |
//---   ---
//
//
//♦ Black Diamond
//Modify the function to take an Int array and print each number in the same fashion but on its own line.

let A = " ___"
let B = "|"
let C = "    |"
let BC = "|   |"
let D = " ___"
let BD = "|___"
let CD = "___|"
let BCD = "|___|"
let E = "|"
let F = "    |"
let EF = "|   |"
let G = " ___"
let EG = "|___"
let FG = "___|"
let EFG = "|___|"


let zero = [A, BC, EFG]
let one = [C, F]
let two = [A, CD, EG]
let three = [A, CD, FG]
let four = [BCD, F]
let five = [A, BD, FG]
let six = [A, BD, EFG]
let seven = [A, C, F]
let eight = [A, BCD, EFG]
let nine = [A, BCD, F]

var lineOne = String()
var lineTwo = String()
var lineThree = String()
var lineFour = String()
var lineFive = String()


func microwavePrint(int: [Int]) {
	
	var numbersToPrint = [String]()
	
	for i in int {
		numbersToPrint.append(i.description)
	}
	
	var blocks: [String] = []
	
	func appendBlocks(members: [String]) {
		for member in members {
			blocks.append(member)
		}
	}
	
	for number in numbersToPrint {
		switch number {
		case "0":
			appendBlocks(members: zero)
		case "1":
			appendBlocks(members: one)
		case "2":
			appendBlocks(members: two)
		case "3":
			appendBlocks(members: three)
		case "4":
			appendBlocks(members: four)
		case "5":
			appendBlocks(members: five)
		case "6":
			appendBlocks(members: six)
		case "7":
			appendBlocks(members: seven)
		case "8":
			appendBlocks(members: eight)
		case "9":
			appendBlocks(members: nine)
		default:
			print("Error printing :(")
		}
	}
	
	for block in blocks {
		print(block)
	}
}

microwavePrint(int: [1, 8, 9])
