//
//  ViewController.swift
//  DeckOfOneCards 2
//
//  Created by Ethan John on 2/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var cardImageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func drawCardButtonTapped(_ sender: Any) {
		drawCard()
	}
	
	func drawCard() {
		
		CardController.drawCard(numberOfCards: 1) { (cards) in
			let card = cards[0]
			CardController.image(forURL: card.image, completion: { (cardImage) in
				guard let image = cardImage else { return }
				self.cardImageView.image = image
			})
		}
	}
}

