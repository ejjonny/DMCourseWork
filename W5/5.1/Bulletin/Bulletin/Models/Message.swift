//
//  Message.swift
//  Bulletin
//
//  Created by Ethan John on 2/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation
import CloudKit

struct Message {
	
	static let messageSubscriptionKey = "messageSubscription"
	static let messageKey = "message"
	fileprivate static let textKey = "text"
	fileprivate static let timeStampKey = "timestamp"
	
	let text: String
	let timeStamp: Date
	
	init(text: String) {
		self.text = text
		self.timeStamp = Date()
	}
	
	init?(record: CKRecord) {
		guard let text = record["text"] as? String,
			let timeStamp = record["timestamp"] as? Date else { return nil }
		self.text = text
		self.timeStamp = timeStamp
	}
}

extension CKRecord {
	convenience init(message: Message) {
		self.init(recordType: Message.messageKey)
		
		self.setValue(message.text, forKey: Message.textKey)
		self.setValue(message.timeStamp, forKey: Message.timeStampKey)
	}
}
