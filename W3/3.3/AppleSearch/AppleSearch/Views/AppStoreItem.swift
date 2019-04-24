//
//  AppStoreItem.swift
//  AppleSearch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct AppStoreItem {
	let title: String
	let subtitle: String
	let imageURL: String?
	
	enum ItemType: String {
		case app = "software"
		case song = "musicTrack"
	}
}

extension AppStoreItem {
	init?(itemType: AppStoreItem.ItemType, dict: [String: Any]) {
		
		let imageURL = dict["artworkUrl100"] as? String
		
		if itemType == .app {
			// build an app
			guard let titleFromDictionary = dict["trackName"] as? String, let subtitle = dict["description"] as? String else { return nil }
			
			self.title = titleFromDictionary
			self.subtitle = subtitle
			self.imageURL = imageURL
			
		} else if itemType == .song {
			//build song
			guard let title = dict["artistName"] as? String, let subtitle = dict["trackName"] as? String else { return nil }
			
			self.title = title
			self.subtitle = subtitle
			self.imageURL = imageURL
		}
		return nil
	}
}
