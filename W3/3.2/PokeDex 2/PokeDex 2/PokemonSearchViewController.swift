//
//  PokemonSearchViewController.swift
//  PokeDex 2
//
//  Created by Ethan John on 2/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController {

	@IBOutlet weak var pokemonImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var searchBar: UISearchBar!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PokemonSearchViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
		PokemonController.fetchPokemon(by: searchTerm) { (pokemon) in
			guard let pokemon = pokemon else { return }
			DispatchQueue.main.async {
				self.nameLabel.text = pokemon.name
				self.weightLabel.text = String(pokemon.weight)
				self.idLabel.text = String(pokemon.id)
				self.searchBar.text = ""
			}
			
			PokemonController.fetchImageFor(pokemon: pokemon, completion: { (image) in
				guard let image = image else { return }
				DispatchQueue.main.async {
					self.pokemonImageView.image = image
				}
			})
		}
	}
}
