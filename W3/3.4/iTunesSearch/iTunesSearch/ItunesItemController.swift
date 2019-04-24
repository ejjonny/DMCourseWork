//
//  ItunesItemController.swift
//  iTunesSearch
//
//  Created by Ethan John on 2/7/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ItunesItemController {
	static let baseURL = URL(string: "https://itunes.apple.com")
	static func fetchItunesItemsFor(searchTerm: String, completion: @escaping ([ItunesItem]) -> Void) {
		
		guard var url = baseURL else { completion([]); return }
		
		url.appendPathComponent("search")
		
		var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		
		let searchTermQueryItem = URLQueryItem(name: "term", value: searchTerm.lowercased())
		
		components?.queryItems = [searchTermQueryItem]
		
		guard let componentsURL = components?.url else { completion([]); return }
		
		var requestURL = URLRequest(url: componentsURL)
		
		requestURL.httpMethod = "GET"
		
		requestURL.httpBody = nil
		
		let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
			if let error = error { print("WE GOT AN ERROR YEEHAW", error); completion([]); return }
			guard let data = data else { print("No data"); completion([]); return }
			
			do {
				let topLevel = try JSONDecoder().decode(TopLevelJSON.self, from: data)
				let items = topLevel.results
				completion(items)
			} catch {
				print("Error decoding items",error, error.localizedDescription)
			}
		}
		dataTask.resume()
	}
	static func fetchImageFor(item: ItunesItem, completion: @escaping (UIImage?) -> Void) {
		guard let url = URL(string: item.albumImageAsString) else { completion(nil); return }
		
		let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error { print(error, "Wasn't able to get the image"); completion(nil); return }
			guard let data = data else { print("We didn't get back data from image request"); completion(nil); return }
			
			let image = UIImage(data: data)
			completion(image)
		}
		dataTask.resume()
	}
}
