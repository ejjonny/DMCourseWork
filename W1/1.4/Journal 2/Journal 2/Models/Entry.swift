//
//  Entry.swift
//  Journal
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class Entry: Equatable, Codable {
    
    var timestamp: Date
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.timestamp = Date()
        self.title = title
        self.body = body
    }
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.body == rhs.body && lhs.timestamp == rhs.timestamp && lhs.title == rhs.title
    }
}
