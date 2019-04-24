//
//  AlertExtension.swift
//  technicalChallengeWeek6
//
//  Created by Ethan John on 3/8/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

extension UIViewController {
	
	func addMemberAlert(completion: @escaping (String) -> Void) {
		let alert = UIAlertController(title: "Add a person", message: nil, preferredStyle: .alert)
		alert.addTextField(configurationHandler: nil)
		let okAction = UIAlertAction(title: "Add", style: .default) { (_) in
			guard let text = alert.textFields?.first?.text else { return }
			completion(text)
		}
		let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
			completion("")
		}
		alert.addAction(okAction)
		alert.addAction(cancel)
		self.present(alert, animated: true, completion: nil)
	}
}
