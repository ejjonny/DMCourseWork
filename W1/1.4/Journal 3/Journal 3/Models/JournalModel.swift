//
//  JournalModel.swift
//  Journal 3
//
//  Created by Ethan John on 1/24/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Journal {
    var title: String
    var entries: [Entry]
    
    init(title: String, entries: [Entry]) {
        self.title = title
        self.entries = entries
    }
}

extension Journal: Equatable {
    static func ==(lhs: Journal, rhs: Journal) -> Bool {
        return lhs.entries == rhs.entries && lhs.title == rhs.title
    }
}
