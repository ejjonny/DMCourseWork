//
//  PokemonSearchViewController.swift
//  PokemonHybrid
//
//  Created by Ethan John on 2/12/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var abilitiesLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	var pokemon: EMPokemon? {
		didSet {
			updateViews()
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
    }
	
	func updateViews() {
		guard let pokemon = pokemon else { print("Pokemon is nil. Not updating"); return }
		EMPokemonController.fetchImage(for: pokemon) { (image) in
			guard let image = image else { print("No image returned"); return }
			DispatchQueue.main.async {
				self.imageView.image = image
			}
		}
		DispatchQueue.main.async {
			self.nameLabel.text = pokemon.name
			self.idLabel.text = String(pokemon.identifier)
			self.abilitiesLabel.text = pokemon.abilities.joined(separator: " , ")
		}
	}
}

extension PokemonSearchViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		guard let input = searchBar.text else { print("Search bar text is nil"); return }
		EMPokemonController.fetchPokemon(forSearchTerm: input) { (pokemon) in
			self.pokemon = pokemon
		}
	}
}
