import UIKit

func averageWithoutLowest(array: [Int]) -> Double {
	
	let sorted = array.sorted(by: <)
	let lowestRemoved = sorted.filter{ $0 != sorted.first }
	return Double(lowestRemoved.reduce(lowestRemoved.first!) { ($0 + $1) / 2 })
}


averageWithoutLowest(array: [1,1,5,100])
