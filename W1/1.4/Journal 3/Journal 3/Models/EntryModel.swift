//
//  EntryModel.swift
//  Journal 3
//
//  Created by Ethan John on 1/24/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Entry {
    var title: String
    var body: String
    var timeStamp: Date
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
        self.timeStamp = Date()
    }
}

extension Entry: Equatable {
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timeStamp == rhs.timeStamp
    }
}
