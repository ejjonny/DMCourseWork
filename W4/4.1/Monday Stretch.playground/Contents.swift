import UIKit

//1.Create a function called convertToScientificNotation that takes a float as a parameter and returns a string.
//2. The return value should be a string of the number in scientific notation.
//3. Example: convertToScientificNotation(8.9) returns "8.9 * 10 ^ 0"
//
//♦ Black Diamond
//Handle negative numbers.

func convertToScientificNotation(_ input: Float) -> String {
	var tens: Float = 10
	// Checks if input is under 10. If so it will return 10 to the 0th power
	if input < 10 {
		return "\(input) * 10 ^ \(0.0)"
	}
	// Otherwise it will increment the power of tens being used - see if we are at the right decimal place.
	while input - tens > 0 {
		tens *= 10
	}
	return "\(input / (tens/10)) * 10 ^ \(tens / 100)"
}

convertToScientificNotation(8.9)
