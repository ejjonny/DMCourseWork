//
//  Person.swift
//  MyFavoriteApp
//
//  Created by Ethan John on 2/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct Person {
	let name: String
	let favoriteApp: String
}

extension Person {
	init?(dict: [String : Any]) {
		guard let name = dict["name"] as? String,
			let favoriteApp = dict["favoriteApp"] as? String else { return nil }
		
		self.name = name
		self.favoriteApp = favoriteApp
	}
	
	var asJSONDictionary: [String : Any] {
		return ["name": self.name, "favoriteApp": self.favoriteApp]
	}
	
	var asData: Data? {
		return JSONSerialization.data(withJSONObject: asJSONDictionary, options: .prettyPrinted)
	}
}
