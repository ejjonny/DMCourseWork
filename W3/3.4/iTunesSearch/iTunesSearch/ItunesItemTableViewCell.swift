//
//  ItunesItemTableViewCell.swift
//  iTunesSearch
//
//  Created by Ethan John on 2/7/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ItunesItemTableViewCell: UITableViewCell {
	
	var itemLandingPad: ItunesItem? {
		didSet {
			updateViews()
		}
	}
	
	func updateViews() {
		guard let item = itemLandingPad else { return }
		self.albumLabel.text = item.albumName
		self.artistName.text = item.artistName
		self.songLabel.text = item.songName
	}

	@IBOutlet weak var albumImageView: UIImageView!
	@IBOutlet weak var artistName: UILabel!
	@IBOutlet weak var songLabel: UILabel!
	@IBOutlet weak var albumLabel: UILabel!
	
}
