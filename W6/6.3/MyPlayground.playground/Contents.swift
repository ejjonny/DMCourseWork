import UIKit

func hasNoDuplicates(_ input: String) -> Bool {
	for char in input.lowercased() {
		let check = input.lowercased().filter{ $0 == char }
		if check.count > 1 {
			return false
		}
	}
	return true
}


hasNoDuplicates("Salsa")
hasNoDuplicates("Dank")
hasNoDuplicates("Biathlon")
hasNoDuplicates("bAklvh..")
