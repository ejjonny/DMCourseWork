//
//  MainTableViewController.swift
//  MyFavoriteApps2
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

	// MARK: - Outlets
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var appField: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		PersonController.shared.getPeople { (success) in
			if success {
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			} else {
				print("Something went wrong getting people")
			}
		}
    }

	// MARK: - Actions
	@IBAction func addButtonTapped(_ sender: Any) {
		guard let name = nameField.text, let app = appField.text, !name.isEmpty, !app.isEmpty else { return }
		PersonController.shared.postPeople(name: name, favoriteApp: app) { (success) in
			if success {
				DispatchQueue.main.async {
					self.nameField.text = ""
					self.appField.text = ""
					self.tableView.reloadData()
				}
			} else {
				print("Something went wrong")
			}
		}
	}
	
	// MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonController.shared.people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteAppCell", for: indexPath)
		
		let person = PersonController.shared.people[indexPath.row]
		cell.textLabel?.text = person.name
		cell.detailTextLabel?.text = person.favoriteApp
        return cell
    }
}
