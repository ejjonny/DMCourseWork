import UIKit

func addInts(_ input: [Int]) -> Int {
	var output: Int = 0
	for int in input {
		output += int
	}
	return output
}

func addInts2(args: Int...) -> Int {
	var output: Int = 0
	for arg: Int in args {
		output += arg
	}
	return output
}


addInts([1,5,2,1,2,2,6])
addInts2(args: 3,2,6,4,7,3,4)
