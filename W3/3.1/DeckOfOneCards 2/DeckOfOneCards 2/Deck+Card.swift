//
//  Deck+Card.swift
//  DeckOfOneCards 2
//
//  Created by Ethan John on 2/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
	let cards: [Card]
}

struct Card: Codable {
	let value: String
	let suit: String
	let image: String
}
