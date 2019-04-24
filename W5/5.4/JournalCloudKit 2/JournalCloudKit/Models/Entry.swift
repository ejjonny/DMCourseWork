//
//  Entry.swift
//  JournalCloudKit
//
//  Created by Eric Lanza on 8/6/18.
//  Copyright © 2018 ETLanza. All rights reserved.
//

import Foundation
import CloudKit

class Entry {
    //MARK: - Properties
    var title: String
    let bodyText: String
    let ckRecordID: CKRecord.ID
	let creatorReference: CKRecord.Reference
    
    //MARK: - Key Constants
    static let entryTypeKey = "Entry"
    fileprivate static let titleKey = "title"
    fileprivate static let bodyTextKey = "bodyText"
    fileprivate static let ckRecordIDKey = "ckRecordID"
	static let creatorReferenceKey = "creatorReference"
	
    //MARK: - Initilizers
	init(title: String, bodyText: String, creatorReference: CKRecord.Reference) {
        self.title = title
        self.bodyText = bodyText
        self.ckRecordID = CKRecord.ID(recordName: self.title)
		self.creatorReference = creatorReference
    }
    
    init?(record: CKRecord) {
        guard let title = record[Entry.titleKey] as? String,
            let bodyText = record[Entry.bodyTextKey] as? String,
			let creatorReference = record[Entry.creatorReferenceKey] as? CKRecord.Reference
            else { return nil }
        
        self.title = title
        self.bodyText = bodyText
        self.ckRecordID = CKRecord.ID(recordName: self.title)
		self.creatorReference = creatorReference
    }
}

//MARK: - Equatable Protocol
extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.ckRecordID == rhs.ckRecordID
    }
}

//MARK: - CKRecord Init
extension CKRecord {
    convenience init(entry: Entry) {
        self.init(recordType: Entry.entryTypeKey, recordID: entry.ckRecordID)
        
        self.setValue(entry.title, forKey: Entry.titleKey)
        self.setValue(entry.bodyText, forKey: Entry.bodyTextKey)
		self.setValue(entry.creatorReference, forKey: Entry.creatorReferenceKey)
    }
}
