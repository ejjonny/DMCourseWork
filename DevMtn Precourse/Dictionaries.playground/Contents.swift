import Cocoa

//var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
//
//print("I have rated \(movieRatings.count) movies.")
//
//let darkoRating = movieRatings["Donnie Darko"]
//
//movieRatings["Dark City"] = 5
//
//movieRatings
//
//let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
//
//if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
//    print("Old rating: \(lastRating); current rating: \(currentRating)")
//}
//movieRatings["The Cabinet of Dr. Caligari"] = 5
//movieRatings["Dark City"] = nil
//
//for (key, value) in movieRatings {
//    print("The movie \(key) was rated \(value)")
//}
//
//for movie in movieRatings.keys {
//    print("User has rated \(movie).")
//}
//
//let album = ["Diet Roast Beef": 268, "Dubba Dubbs Stubs His Toe": 467, "Smokey's Carpet Cleaning Service": 187, "Track 4": 221]

var arkZC : Array = [38089, 30092, 29037, 38084, 47058]
var gorgaCountyZipCodes : [String:[Int]] = ["Arkansas": [11111, 30092, 29037, 38084, 47058], "QuaXamole": arkZC, "Zupas": arkZC]


print("Gorga has the following zip codes: \(gorgaCountyZipCodes["Arkansas"]!)","\(gorgaCountyZipCodes["QuaXamole"]!)","\(gorgaCountyZipCodes["QuaXamole"]!)", separator : "\n                                   ")

var daysOfTheWeek = ["1": "Monday", "2": "Tuesday", "3": "Wednesday", "5": "Friday", "6": "Saturday", "7": "Sunday"]

var dalskj = [1,2,3,4,5]
var dann = [2,3,4,5]
dalskj += dann

