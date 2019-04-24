//
//  CardController.swift
//  DeckOfOneCards 2
//
//  Created by Ethan John on 2/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class CardController {
	// CRUD
	private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
	
	static func drawCard(numberOfCards: Int, completion: @escaping ((_ cards: [Card]) -> Void)) {
		
		// Build URL
		guard let url = baseURL else { fatalError("URL optional is having issues") }
		var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		let countQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
		components?.queryItems = [countQueryItem]
		
		// Build request (this only needs to happen if the URL needs to be dynamic)
		guard let requestURL = components?.url else { return }
		print(requestURL)
		
		// Get data
		var request = URLRequest(url: requestURL)
		request.httpMethod = "GET"
		
		// Data Task
		let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
			do {
			// If the error parameter that came back is nil we throw that error and exit the handler.
			if let downloadError = error { throw downloadError }
			// If the data is nil we throw an NSError and exit the handler.
			guard let data = data else { throw NSError() }
			// If we made it to here things are going well.
			// Decode
			let decoder = JSONDecoder()
			let deck = try! decoder.decode(TopLevelDictionary.self, from: data)
			completion(deck.cards)
			} catch {
				print("Error retrieving cards from \(requestURL)")
				completion([])
				return
			}
		}
		dataTask.resume()
		// Handle data / errors
	}
	
	static func image(forURL urlString: String, completion: @escaping (UIImage?) -> Void) {
		// Build URL
		guard let url = URL(string: urlString) else { return print("Error trying to create your image URL")}
		
		// Data task
		let imageDataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
			do {
				if let imageError = error { throw imageError }
				guard let data = data, let image = UIImage(data: data) else { DispatchQueue.main.async {
					completion(nil)
					}
					return
				}
				DispatchQueue.main.async {
					completion(image)
				}
				//				let decoder = JSONDecoder()
				//				let image = try! decoder.decode(Card.image.self, from: data)
				//				completion(image)
			} catch {
				print("Error retrieving cards from \(url)")
				completion(nil)
				return
			}
		}
		imageDataTask.resume()
	}
}
