//
//  NoteModel.swift
//  Notes
//
//  Created by Ethan John on 1/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Note: Codable {
    var body: String
    
    init(body: String) {
        self.body = body
    }
}

extension Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.body == rhs.body
    }
}
