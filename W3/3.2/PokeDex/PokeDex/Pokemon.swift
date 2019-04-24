//
//  Pokemon.swift
//  PokeDex
//
//  Created by Ethan John on 2/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
	let name: String
	let weight: Int
	let id: Int
	
	let sprites: Sprite
}

struct Sprite: Codable {
	
	let pokemonImageURLAsString: String
	
	enum CodingKeys: String, CodingKey {
		case pokemonImageURLAsString = "front_default"
	}
}
