//
//  MessageSearchViewController.swift
//  Bulletin
//
//  Created by Ethan John on 2/26/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class MessageSearchViewController: UIViewController {

	@IBOutlet weak var messageTableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	let userController = UserController()
	let messageController = MessageController()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		messageTableView.dataSource = self
		searchBar.delegate = self
		userController.requestDiscoverabilityAuthentication { (success) in
			if success {
				// Handle
			}
		}
    }
}

extension MessageSearchViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messageController.filteredMessages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
		let message = messageController.filteredMessages[indexPath.row]
		cell.textLabel?.text = message.text
		cell.detailTextLabel?.text = message.timeStamp.asString()
		return cell
	}
}

extension MessageSearchViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let input = searchBar.text else { return }
		messageController.fetchMessagesForUser(email: input) { (success) in
			if success {
				DispatchQueue.main.async {
					self.messageTableView.reloadData()
				}
			}
		}
	}
}
