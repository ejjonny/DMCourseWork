//
//  PostTableViewController.swift
//  Bulletin
//
//  Created by Ethan John on 2/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
	
	let messageController = MessageController()
	
	// MARK: - Outlets
	@IBOutlet weak var postField: UITextField!
	@IBOutlet weak var postButton: UIButton!
	
	// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		self.reload()
		postButton.layer.cornerRadius = 5
    }
	
	func reload() {
		messageController.fetchMessages { (success) in
			if success {
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}
	
	@IBAction func postButtonTapped(_ sender: Any) {
		guard let text = postField.text, !text.isEmpty else { return }
		messageController.post(message: text) { (success) in
			if (success) {
				DispatchQueue.main.async {
					self.postField.text = ""
					self.tableView.reloadData()
				}
			}
		}
	}
	
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageController.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)

		let message = messageController.messages[indexPath.row]
		
        cell.textLabel?.text = message.text
		cell.detailTextLabel?.text = message.timeStamp.asString()

        return cell
    }
}
