//
//  UserController.swift
//  Bulletin
//
//  Created by Ethan John on 2/26/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation
import CloudKit

class UserController {
	func requestDiscoverabilityAuthentication(completion: @escaping (Bool) -> Void) {
		CKContainer.default().status(forApplicationPermission: .userDiscoverability) { (status, error) in
			if let error = error {
				print("Error getting auth status: \(error, error.localizedDescription)")
				completion(false)
				return
			}
			
			guard status != .granted else { completion(true) ; return }
			CKContainer.default().requestApplicationPermission(.userDiscoverability, completionHandler: { (status, error) in
				if let error = error {
					print("Error obtaining discoverability permission: \(error, error.localizedDescription)")
					completion(false)
					return
				}
				if status == .granted {
					completion(true)
				} else {
					completion(false)
				}
			})
		}
	}
	
	func fetchUserWith(email: String, completion: @escaping (CKUserIdentity?, Error?) -> Void) {
		CKContainer.default().discoverUserIdentity(withEmailAddress: email) { (userID, error) in
			if let error = error {
				print("Error retrieving user's ID: \(error, error.localizedDescription)")
				completion(nil, error)
				return
			}
			guard let userID = userID else { completion(nil, nil) ; return }
			completion(userID, nil)
		}
	}
}
