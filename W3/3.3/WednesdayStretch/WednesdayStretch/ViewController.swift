//
//  ViewController.swift
//  WednesdayStretch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var genreLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func getGenreButtonTapped(_ sender: Any) {
		GenreController.shared.getGenre(numberOfGenres: 4) { (genres) in
			DispatchQueue.main.async {
				var stringToDisplay = ""
				for genre in genres {
					guard let description = genre?.description else { return }
					stringToDisplay.append(description)
				}
				self.genreLabel.text = stringToDisplay
			}
		}
	}
}

