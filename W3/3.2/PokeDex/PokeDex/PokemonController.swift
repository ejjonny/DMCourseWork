//
//  PokemonController.swift
//  PokeDex
//
//  Created by Ethan John on 2/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PokemonController {
	static func searchForPokemon(by searchTerm: String, completion: @escaping ((Pokemon?) -> Void)){
		
		let baseURLAsString = "https://pokeapi.co/api/v2/pokemon/"
		let urlAsString = baseURLAsString + searchTerm.lowercased()
		guard let url = URL(string: urlAsString) else {
			print("url was not valid")
			completion(nil)
			return
		}
		let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
			if let error = error { print(error); return }
			guard let data = data else { print("No data found"); completion(nil); return }
			
		
		
		do {
			let decoder = JSONDecoder()
			let pokemon = try decoder.decode(Pokemon.self, from: data)
			completion(pokemon)
		} catch {
			print(error, error.localizedDescription)
			completion(nil)
			return
		}
		
		}
		dataTask.resume()
	}
	
	static func getPokemonImage(_ pokemon: Pokemon, completion: @escaping ((UIImage?) -> Void)){
		guard let urlForImage = URL(string: pokemon.sprites.pokemonImageURLAsString) else {
			print("No url for poke image")
			completion(nil)
			return
		}
		
		let dataTask = URLSession.shared.dataTask(with: urlForImage) { (data, _, error) in
			if let error = error { print(error, error.localizedDescription); return }
			guard let data = data else {
				completion(nil)
				return
			}
			
			let image = UIImage(data: data)
			completion(image)
		}
		dataTask.resume()
	}
}
