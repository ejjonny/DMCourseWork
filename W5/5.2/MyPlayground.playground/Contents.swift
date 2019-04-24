
/*
Write a function that takes a string and returns the biggest word in that string.
Make sure to remove punctuation and whitespace.


Example output:

longestWord("This string, has a gigantic! word in it...") returns "gigantic"

longestWord("one, two, three") returns "three"

Hint: Look up NSCharacterSet methods to remove whitespace and punctuation. Create the charSets as NSMutableCharset objects so you can combine the two CharSets. Call the componentsSeperatedByCharacterInSet method on the parameter string to get an array of strings after separating them by the charSets. Loop through the array to check against your return string length.
	
	♦ Black Diamond
Do this in Objective-C. Then do palindrome in Objective-C using recursion.
*/

// O(n)

import UIKit

func longestWord(from input: String) -> String {
	
	let noPunctuation = input.components(separatedBy: .punctuationCharacters)
	let joined = noPunctuation.joined()
	let noWhiteSpace = joined.components(separatedBy: .whitespaces)
	let finalArray = noWhiteSpace.filter{ !$0.isEmpty }
	
	var longest = String()
	
	for word in finalArray {
		if word.count > longest.count {
			longest = word
		}
	}
	return longest
}


print(longestWord(from: "I........ am a hippopotamus"))
