//
//  Genre.swift
//  WednesdayStretch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Genre: Codable {
	var description: String
	
	init?(description: String) {
		self.description = description
	}
}
