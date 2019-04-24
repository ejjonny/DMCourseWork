//
//  EntryController.swift
//  Journal
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class EntryController: Codable {
    var entries: [Entry] = []
    static let shared = EntryController()
    init() {
        loadFromPersistentStorage()
    }
    
    func addEntry(withTitle title: String, withText text: String) {
        entries.append(Entry(title: title, body: text))
        saveToPersistentStorage()
    }
    
    func remove(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistentStorage()
    }
    
    func update(entry: Entry, withTitle title: String, andBody body: String) {
        guard let index = entries.index(of: entry) else { return }
        entries[index].title = title
        entries[index].body = body
        entries[index].timestamp = Date()
        saveToPersistentStorage()
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadFromPersistentStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
