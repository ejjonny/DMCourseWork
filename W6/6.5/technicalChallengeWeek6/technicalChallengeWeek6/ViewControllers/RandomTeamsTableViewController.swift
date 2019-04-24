//
//  RandomTeamsTableViewController.swift
//  technicalChallengeWeek6
//
//  Created by Ethan John on 3/8/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class RandomTeamsTableViewController: UITableViewController {

	// Mark: - Actions
	@IBAction func shuffleButtonTapped(_ sender: Any) {
		PersonController.shared.shufflePeople()
		tableView.reloadData()
	}
	
	@IBAction func addMemberButtonTapped(_ sender: Any) {
		addMemberAlert { (input) in
			guard !input.isEmpty else { print("Person object not initialized - no input.") ; return }
			PersonController.shared.addPerson(name: input)
			self.tableView.reloadData()
		}
	}
	
	// MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
		return PersonController.shared.groups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Group \(section + 1)"
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
		guard PersonController.shared.groups.indices.contains(indexPath.section),
			PersonController.shared.groups[indexPath.section].indices.contains(indexPath.row) else { return UITableViewCell() }
		let person = PersonController.shared.groups[indexPath.section][indexPath.row]
		cell.textLabel?.text = person.name
		return cell
    }

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			let person = PersonController.shared.people[indexPath.row]
			PersonController.shared.delete(person: person) { (success) in
				if success {
					tableView.reloadData()
				}
			}
        }
    }
}
