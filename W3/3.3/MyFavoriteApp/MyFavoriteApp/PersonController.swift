//
//  PersonController.swift
//  MyFavoriteApp
//
//  Created by Ethan John on 2/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class PersonController {
	static let shared = PersonController()
	var people: [Person] = []
	
	static let baseURL = URL(string: "")
	
	static func getPeople() -> [Person] {
		let fullURL = baseURL?.appendingPathComponent("people")
		let fullURLAsJSON = fullURL?.appendingPathComponent("json") else {
			return []
		}
		
		let request = URLRequest(url: fullURLAsJSON)
		request.httpMethod = "GET"
		request.httpBody = nil
		
		let dataTask = URLSession.shared.dataTask(with: request) {
	}
}
