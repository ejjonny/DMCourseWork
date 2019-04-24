//
//  ItemTableViewCell.swift
//  AppleSearch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var itemImageView: UIImageView!
	
	var item: AppStoreItem? {
		// Update cell
		didSet {
			guard let item = item else { return }
			titleLabel.text = item.title
			subtitleLabel.text = item.subtitle
		}
	}
}
