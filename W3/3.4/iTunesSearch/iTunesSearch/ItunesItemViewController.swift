//
//  ItunesItemViewController.swift
//  iTunesSearch
//
//  Created by Ethan John on 2/7/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ItunesItemViewController: UIViewController {
	
	var itunesItems: [ItunesItem] = [] {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
				self.searchBar.text = ""
			}
		}
	}
	
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		searchBar.delegate = self
    }
}

extension ItunesItemViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itunesItems.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItunesItemTableViewCell
		
		let itunesItem = itunesItems[indexPath.row]
		cell?.itemLandingPad = itunesItem
		
		ItunesItemController.fetchImageFor(item: itunesItem) { (image) in
			DispatchQueue.main.async {
				cell?.imageView?.image = image
				tableView.reloadData()
			}
		}
		
		return cell ?? UITableViewCell()
	}
}

extension ItunesItemViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let term = searchBar.text, !term.isEmpty else { return }
		ItunesItemController.fetchItunesItemsFor(searchTerm: term) { (items) in
			self.itunesItems = items
		}
	}
}
