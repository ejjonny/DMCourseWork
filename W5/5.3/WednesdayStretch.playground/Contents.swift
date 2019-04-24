import UIKit

func isPalindrome(input: String) -> Bool {
	let white = CharacterSet.whitespaces
	let punct = CharacterSet.punctuationCharacters
	let numbers = CharacterSet.decimalDigits
	
	let filteredString = String(input.unicodeScalars.filter{ !white.contains($0) && !punct.contains($0) && !numbers.contains($0)})
	
	guard String(filteredString.lowercased().reversed()) == filteredString.lowercased() else { return false }
	
	return true
}

isPalindrome(input: "ddammIT I'M98 madd!!!")
