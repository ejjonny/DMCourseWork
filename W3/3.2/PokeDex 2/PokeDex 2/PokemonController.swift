//
//  PokemonController.swift
//  PokeDex 2
//
//  Created by Ethan John on 2/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PokemonController {
	static let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon")
	
	static func fetchPokemon(by searchTerm: String, completion: @escaping ((Pokemon?) -> Void)) {
		guard let baseURL = baseURL else { completion(nil); return }
		let finalURL = baseURL.appendingPathComponent(searchTerm.lowercased())
		
		let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
			if let error = error { print("Error fetching pokemon from API", error); completion(nil); return }
			
			guard let data = data else { print("No data found from API"); completion(nil); return }
			
			do {
				let decoder = JSONDecoder()
				let pokemon = try decoder.decode(Pokemon.self, from: data)
				completion(pokemon)
				return
			} catch {
				print(error, error.localizedDescription)
				completion(nil)
				return
			}
		}
		dataTask.resume()
	}
	
	static func fetchImageFor(pokemon: Pokemon, completion: @escaping ((UIImage?) -> Void)) {
		guard let finalURl = URL(string: pokemon.sprite.pokemonImageURLAsString) else { completion(nil); return }
		
		let dataTask = URLSession.shared.dataTask(with: finalURl) { (data, _, error) in
			if let error = error { print("Error fetching image from API", error); completion(nil); return }
			guard let data = data else { print("No data found from Api"); completion(nil); return }
			let pokemonImage = UIImage(data: data)
			completion(pokemonImage)
			return
		}
		dataTask.resume()
	}
}
