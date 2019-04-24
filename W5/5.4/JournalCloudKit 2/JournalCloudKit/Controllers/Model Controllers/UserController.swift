//
//  UserController.swift
//  JournalCloudKit
//
//  Created by Eric Lanza on 2/27/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

import Foundation
import CloudKit

class UserController {
    
    // Singleton - Shared Instance
    
    static let shared = UserController()
    
    // Source of Truth - Single User
    
    var loggedInUser: User?
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    // Save a user to CloudKit
    // Also the create User
    func saveUserWith(email: String, username: String, completion: @escaping (Bool) -> Void) {
        CKContainer.default().fetchUserRecordID { (appleUserRecordID, error) in
            if let error = error {
                print("Error fetching user's apple ID: \(error.localizedDescription)")
                completion(false)
                return
            }
            // Unwrap the Apple User Record ID
            guard let appleUserRecordID = appleUserRecordID else { completion(false); return }
            
            // Create a CKRecord.Reference using the Apple User Record ID we just unwrapped
            let reference = CKRecord.Reference(recordID: appleUserRecordID, action: .deleteSelf)
            
            // Init a new user with all the constants
            let newUser = User(email: email, username: username, appleUserRef: reference)
            
            // Init a new CKRecord with the newUser we just created
            let userRecord = CKRecord(user: newUser)
            
            // Save the CKRecord we just created
            self.publicDB.save(userRecord, completionHandler: { (record, error) in
                if let error = error {
                    print("Saving user record to Public DB: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                // Unwrap the CKRecord from the .save method,
                // and convert that CKRecord into our User model object
                guard let record = record, let user = User(record: record) else {
                    completion(false)
                    return
                }
                
                // Set our logged in user to the user we just got back from CloudKit
                self.loggedInUser = user
                completion(true)
            })
        }
    }
    
    // Fetch the user from CloudKit
    
    func fetchUser(completion: @escaping (Bool) -> Void) {
        
        // Fetch the users Apple ID
        CKContainer.default().fetchUserRecordID { (appleUserRecordID, error) in
            if let error = error {
                print("Error fetching user's apple ID: \(error.localizedDescription) : \(error)")
                completion(false)
                return
            }
            
            guard let appleUserRecordID = appleUserRecordID else { completion(false); return }
            
            // Create a CKRecord.Reference from the Apple Account Record ID
            
            let appleUserRef = CKRecord.Reference(recordID: appleUserRecordID, action: .deleteSelf)
            
//            let predicate = NSPredicate(format: "appleUserRef == %@", appleUserRef)
            
            let newPredicate = NSPredicate(format: "%K == %@", argumentArray: [User.appleUserRefKey, appleUserRef])
            
            let query = CKQuery(recordType: User.typeKey, predicate: newPredicate)
            
            self.publicDB.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
                if let error = error {
                    print("Error finding user apple user ref: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                guard let record = records?.first else { completion(false); return }
                
                let newUser = User(record: record)
                
                self.loggedInUser = newUser
                completion(true)
            })
        }
    }
}
