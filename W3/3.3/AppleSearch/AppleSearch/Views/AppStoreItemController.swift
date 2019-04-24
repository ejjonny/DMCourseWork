//
//  AppStoreItemController.swift
//  AppleSearch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class AppStoreItemController {
	static func getItems(type: AppStoreItem.ItemType, searchText: String, completion: @escaping (([AppStoreItem]) -> Void)) {
		let baseURL = URL(string: "https://itunes.apple.com/search")!
		guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else { completion([]); return }
		let searchTermQuery = URLQueryItem(name: "term", value: searchText)
		let entityQuery = URLQueryItem(name: "entity", value: type.rawValue)
		components.queryItems = [searchTermQuery, entityQuery]
		
		guard let url = components.url else { completion([]); return }
		
		URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error { print(error); completion([]); return }
			guard let data = data else { completion([]); return }
			guard let topLevelJSON = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] else { completion([]); return }
			guard let appStoreItemDictionaries =  topLevelJSON["results"] as? [[String: Any]] else { completion([]); return }
			
			var allItems: [AppStoreItem] = []
			
			for itemDictionary in appStoreItemDictionaries {
				if let newItem = AppStoreItem(itemType: type, dict: itemDictionary) {
					allItems.append(newItem)
				}
			}
			
			completion(allItems)
			
		}.resume()
		
		print(components.url!)
	}
}
