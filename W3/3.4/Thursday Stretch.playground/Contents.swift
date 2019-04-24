import UIKit

//Make a function that takes in a given amount of money i.e. 2.15 and returns a string of the amount of dollars, quarters, dimes, nickels, and pennies needed to make that amount of money. Return something like : Your change is 1 quarter, 2 dimes, 0 nickels, and 1 penny
//
//♦ Black Diamond
//Make a function that takes in the cost of an item, and the amount of money paid (i.e. the cost is $2.15 and the amount of money paid is $5.00) and then returns a string detailing the amount of change in dollars, quarters, dimes, nickels, and pennies.
//
//When this works, try to recreate Swift's built-in filter function. Just like the Swift function, it should be generic and it should take a closure that returns a Bool, from which it determines how to filter your sequence type.

func change(from amount: Double) -> String {
	var remainingInCents = Int(amount * 100)
	var coinsToReturn = [0, 0, 0, 0]
	let coinValues = [25, 10, 5, 1]
	
	for coin in coinValues.indices {
		while coinValues[coin] <= remainingInCents {
			coinsToReturn[coin] += 1
			remainingInCents -= coinValues[coin]
		}
	}
	
	return "Your change is \(coinsToReturn[0]) quarters, \(coinsToReturn[1]) dimes, \(coinsToReturn[2]) nickels, \(coinsToReturn[3]) cents."
}

print(change(from: 5.98))


