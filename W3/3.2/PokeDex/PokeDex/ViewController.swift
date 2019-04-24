//
//  ViewController.swift
//  PokeDex
//
//  Created by Ethan John on 2/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
	
	@IBOutlet weak var pokeSearchBar: UISearchBar!
	@IBOutlet weak var pokeImageLabel: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var pokeIDLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		pokeSearchBar.delegate = self
	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let searchText = searchBar.text, !searchText.isEmpty else { return }
		PokemonController.searchForPokemon(by: searchBar.text!) { (pokemon) in
			guard let pokemon = pokemon else { return }
			
			DispatchQueue.main.async {
				
				self.pokeSearchBar.text = ""
				self.nameLabel.text = pokemon.name
				self.weightLabel.text = String(pokemon.weight)
				self.pokeIDLabel.text = String(pokemon.id)
			}
			PokemonController.getPokemonImage(pokemon, completion: { (image) in
				DispatchQueue.main.async {
					
					self.pokeImageLabel.image = image
				}
			})
			
			
		}
		
	}

}

