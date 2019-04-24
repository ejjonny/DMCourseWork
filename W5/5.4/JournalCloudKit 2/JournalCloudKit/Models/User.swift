//
//  User.swift
//  JournalCloudKit
//
//  Created by Eric Lanza on 2/27/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

import Foundation
import CloudKit

class User {
    
    static let typeKey = "User"
    static let appleUserRefKey = "appleUserRef"
    fileprivate static let emailKey = "email"
    fileprivate static let usernameKey = "username"
    
    var email: String
    var username: String
    let appleUserRef: CKRecord.Reference
    let recordID: CKRecord.ID
    
    
    // Memberwise Initilizier
    init(email: String, username: String, appleUserRef: CKRecord.Reference, recordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.email = email
        self.username = username
        self.appleUserRef = appleUserRef
        self.recordID = recordID
    }

    // Turns the CKRecord from CloudKit back into our custom User model
    convenience init?(record: CKRecord) {
        guard let email = record[User.emailKey] as? String,
            let username = record[User.usernameKey] as? String,
            let appleUserRef = record[User.appleUserRefKey] as? CKRecord.Reference else { return nil }
        self.init(email: email, username: username,
                  appleUserRef: appleUserRef, recordID: record.recordID)
    }
}

extension CKRecord {
    
    // Converts our User model into a CKRecord ([String:Any]) to be stored in CloudKit
    convenience init(user: User) {
        self.init(recordType: User.typeKey, recordID: user.recordID)
        
        //  Adds a Key:Value pair to the CKRecord
        self.setValue(user.email, forKey: User.emailKey)
        self.setValue(user.username, forKey: User.usernameKey)
        self.setValue(user.appleUserRef, forKey: User.appleUserRefKey)
    }
}
