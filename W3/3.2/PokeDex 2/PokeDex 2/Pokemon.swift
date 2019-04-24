//
//  Pokemon.swift
//  PokeDex 2
//
//  Created by Ethan John on 2/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
	let name: String
	let id: Int
	let weight: Int
	let sprite: Sprite
	
	enum CodingKeys: String, CodingKey {
		case sprite = "sprites"
		case name
		case id
		case weight
	}
}

struct Sprite: Codable {
	let pokemonImageURLAsString: String
	
	enum CodingKeys: String, CodingKey {
		case pokemonImageURLAsString = "front_shiny"
	}
}
