import Cocoa

var groceryBag : Set = ["Apples", "Oranges", "Pineapple"]

for food in groceryBag {
    print(food)
}

var hasBananas = groceryBag.contains("Bananas")
var friendsGroceryBag : Set = ["Bananas", "Cereal", "Milk", "Oranges"]
groceryBag = groceryBag.union(friendsGroceryBag)

var roommatesGroceryBag : Set = ["Apples", "Bananas", "Cereal", "Toothpaste"]
groceryBag = groceryBag.intersection(roommatesGroceryBag)
print(groceryBag)
var yourSecondBag : Set = ["Berries", "Yogurt"]
var roommatesSecondBag : Set = ["Grapes", "Honey"]
var disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)

//let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
//let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])
//
//myCities.isSuperset(of: yourCities)
