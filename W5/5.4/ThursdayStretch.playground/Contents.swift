import UIKit

func gcd(x: Int, y: Int) -> Int {
	
	// Find higher & lower of input
	let lower = x > y ? y : x
	let higher = x < y ? y : x
	
	// Recursive function
	func gd(i: Int) -> Int {
		// Stop recursion at 1
		if lower % i == 0, higher % i == 0 {
			// If iteration meets requirements return gcd
			return i
		}
		// Recursion increments
		return gd(i: i % higher)
	}
	
	return gd(i: lower)
}

gcd(x: 11, y: 20)
