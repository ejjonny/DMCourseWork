//
//  MessageController.swift
//  Bulletin
//
//  Created by Ethan John on 2/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation
import CloudKit

class MessageController {
	
	// MARK: - Source of Truth
	var messages: [Message] = []
	var filteredMessages: [Message] = []
	
	let publicDB = CKContainer.default().publicCloudDatabase
	
	// MARK: - Object Management
	func post(message: String, completion: @escaping (Bool) -> Void) {
		
		let newMessage = Message(text: message)
		let messageAsRecord = CKRecord(message: newMessage)
		
		publicDB.save(messageAsRecord) { (record, error) in
			if let error = error {
				print("Error saving to public DB: \(error, error.localizedDescription)")
				completion(false)
				return
			}
			guard let record = record else { completion(false); return }
			if let newMessage = Message(record: record) {
				self.messages.insert(newMessage, at: 0)
				completion(true)
			}
			completion(false)
		}
	}
	
	func fetchMessages(completion: @escaping (Bool) -> Void) {
		
		let predicate = NSPredicate(value: true)
		let query = CKQuery(recordType: Message.messageKey, predicate: predicate)
		publicDB.perform(query, inZoneWith: nil) { (records, error) in
			if let error = error {
				print("Error fetching messages: \(error, error.localizedDescription)")
				completion(false)
				return
			}
			let records = records?.compactMap{ Message.init(record: $0) }
			guard let messages = records else { return }
			
			let sorted = messages.sorted{ $0.timeStamp < $1.timeStamp }
			
			self.messages = sorted
			completion(true)
		}
	}
	
	func subscribeToCreationOfMessages(completion: @escaping (CKSubscription?, Error?) -> Void) {
		
		let predicate = NSPredicate(value: true)
		let subscription = CKQuerySubscription(recordType: Message.messageKey, predicate: predicate, subscriptionID: Message.messageSubscriptionKey, options: .firesOnRecordCreation)
		let notificationInfo = CKSubscription.NotificationInfo()
		notificationInfo.title = "yo"
		notificationInfo.alertBody = "New Message"
		subscription.notificationInfo = notificationInfo
		
		publicDB.save(subscription) { (subscription, error) in
			if let error = error {
				print(error, error.localizedDescription)
				completion(nil, error)
			}
			
			guard let subscription = subscription else { completion(nil, error) ; return }
			completion(subscription, nil)
		}
	}
	
	func fetchMessagesForUser(email: String, completion: @escaping (Bool) -> Void) {
		UserController().fetchUserWith(email: email) { (userID, error) in
			if let error = error {
				print("Error fetching user with email: \(error, error.localizedDescription)")
				completion(false)
				return
			}
			guard let userID = userID, let userRecordID = userID.userRecordID else { completion(false) ; return }
			
			let predicate = NSPredicate(format: "creatorUserRecordID == %@", userRecordID)
			let query = CKQuery(recordType: Message.messageKey, predicate: predicate)
			self.publicDB.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
				if let error = error {
					print("Error fetching records associated with ID: \(error, error.localizedDescription)")
					completion(false)
					return
				}
				guard let records = records else { completion(false) ; return }
				self.filteredMessages = records.compactMap{ Message(record: $0) }
				completion(true)
			})
		}
	}
}
