//
//  PersonController.swift
//  MyFavoriteApps2
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class PersonController {
	
	static let shared = PersonController()
	
	var people: [Person] = []
	
	let baseURL = URL(string: "https://testapi-797a4.firebaseio.com")
	
	func getPeople(completion: @escaping (Bool) -> Void) {
		
		guard let fullURL = baseURL?.appendingPathComponent("people").appendingPathExtension("json") else { completion(false); return }
		var request = URLRequest(url: fullURL)
		request.httpMethod = "GET"
		
		let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
			if let error = error { print("Recieved an error from request", error, error.localizedDescription); completion(false); return }
			guard let data = data else { print("Didn't get any data"); completion(false); return }
			
			var people: [Person] = []
			
			guard let jsonDictionaries = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { print("Json serialization failed"); completion(false); return }
			
			guard let jsonDicts = jsonDictionaries as? [String:[String: Any]] else { print("Json data type might be incorrect"); completion(false); return }
			
			for dict in jsonDicts {
				if let newPerson = Person(dict: dict.value) {
					people.append(newPerson)
				}
			}
			PersonController.shared.people = people
			completion(true)
		}
		dataTask.resume()
	}
	
	func postPeople(name: String, favoriteApp: String, completion: @escaping (Bool) -> Void) {
		guard let fullURL = baseURL?.appendingPathComponent("people").appendingPathExtension("json") else { completion(false); return }
		
		let newPerson = Person(name: name, favoriteApp: favoriteApp)
		
		var request = URLRequest(url: fullURL)
		request.httpMethod = "POST"
		request.httpBody = newPerson.asData
		
		let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
			if let error = error { print("We got an error boys", error, error.localizedDescription); completion(false); return }
			guard data != nil else { print("We didn't get data boys"); completion(false); return }
			PersonController.shared.people.append(newPerson)
			completion(true)
		}
		dataTask.resume()
	}
}
