import UIKit
/*
Hashtags

Build a Restaurant model object with name, streetAddress, city, state, and reviews properties.
Build a Review model object with a username and text property.
Instantiate an array of Restaurant and Review objects. Make sure that each Restaurant object holds an array of reviews. Add hashtags to some of your reviews or restaurant descriptions. (Use Yelp or Google to help you come up with Restaurants and Reviews)
Add a hashtags computed property to the Restaurant object that returns an array of any hashtags in the Restaurant or Review.
Check your computed property by printing a list of hashtags of each review and restaurant.


Searching

Add a SearchableObject protocol with one function matchesSearchTerm(searchTerm: String).
Implement the function on both model objects.
Demonstrate your search by printing a list of Restaurants that match a variety of search terms.
*/

protocol SearcableObject {
	func matchesSearchTerm(searchTerm: String) -> Bool
}

class Review {
	let username: String
	let text: String
	init(username: String, text: String) {
		self.username = username
		self.text = text
	}
}

class Restaurant: SearcableObject {
	let name: String
	let streetAddress: String
	let city: String
	let state: String
	let reviews: [Review]
	var hashtags: [String] {
		var tags: [String] = []
		self.reviews.map{ $0.text.split(separator: " ").filter{ $0.hasPrefix("#") }.map{ tags.append(String($0)) } }
		return tags
	}
	
	func matchesSearchTerm(searchTerm: String) -> Bool {
		var text: [String] = []
		if name.lowercased() == searchTerm.lowercased() || streetAddress.lowercased() == searchTerm.lowercased() || city.lowercased() == searchTerm.lowercased() || state.lowercased() == searchTerm.lowercased() {
			return true
		}
		self.reviews.map{ $0.text.split(separator: " ").map{ text.append(String($0)) } }
		if text.contains(where: { $0.lowercased() == searchTerm.lowercased() }) {
			return true
		}
		var usernames: [String] = []
		self.reviews.map{ $0.username.split(separator: " ").map{ usernames.append(String($0)) } }
		if usernames.contains(where: { $0.lowercased() == searchTerm.lowercased() }) {
			return true
		}
		return false
	}
	
	init(name: String, streetAddress: String, city: String, state: String, reviews: [Review]) {
		self.name = name
		self.streetAddress = streetAddress
		self.city = city
		self.state = state
		self.reviews = reviews
	}
}

let bodega = Restaurant(name: "Bodega", streetAddress: "20149", city: "SLC", state: "UT", reviews: [Review(username: "Guadalupe", text: "Solid place. #Sick"), Review(username: "Jon", text: "Favorite place to drink IPAs #dank #mclovinit")])

print(bodega.hashtags)
print(bodega.matchesSearchTerm(searchTerm: "Guadalupe"))
