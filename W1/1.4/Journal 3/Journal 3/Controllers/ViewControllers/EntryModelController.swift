//
//  EntryModelController.swift
//  Journal 3
//
//  Created by Ethan John on 1/24/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class EntryModelController {
    
    // Source of truth
    var entries: [Entry] = []
    
    // Singleton
    var shared = EntryModelController()
    
    // Create, Read, Update, Delete
    func create(entry: Entry) {
        self.entries.append(entry)
    }
    
    func update(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        self.entries[index] = entry
    }
    
    func remove(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        self.entries.remove(at: index)
    }
}
