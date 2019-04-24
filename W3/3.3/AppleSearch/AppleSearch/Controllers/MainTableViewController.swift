//
//  MainTableViewController.swift
//  AppleSearch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

	@IBOutlet weak var itemSegmentedControl: UISegmentedControl!
	@IBOutlet weak var itemSearchBar: UISearchBar!
	
	var appStoreItems: [AppStoreItem] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()

		AppStoreItemController.getItems(type: .song, searchText: "Bible") { (item) in
			self.appStoreItems = item
			DispatchQueue.main.async {
				
				self.tableView.reloadData()
			}
		}
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appStoreItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell

        let appStoreItem = appStoreItems[indexPath.row]
		cell.item = appStoreItem

        return cell
    }
}
