//
//  NoteController.swift
//  Notes
//
//  Created by Ethan John on 1/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class NoteController: Codable {
    // Singleton
    static var shared = NoteController()
    // Source of truth
    var notes: [Note] = []
    var filteredNotes: [Note] = []
    // CRUD (All changes are made to both filtered and unfiltered list)
    func createNote(body: String) {
        notes.append(Note(body: body))
        filteredNotes.append(Note(body: body))
        saveToPersistentStore()
    }
    func update(note: Note, withBody body: String) {
        note.body = body
        saveToPersistentStore()
    }
    func delete(note: Note) {
        guard let index = notes.index(of: note) else { print("Unable to locate the note to delete in the source of truth array :(") ; return }
        notes.remove(at: index)
        filteredNotes.remove(at: index)
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    // Get URL
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "notes.json"
        let fullURL = urls[0].appendingPathComponent(fileName)
        return fullURL
    }
    
    // Save at URL
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(notes)
            try data.write(to: fileURL())
        } catch let error {
            print(error.localizedDescription)
        }
    }
    // Load from URL
    func loadFromPersistentStore() -> [Note] {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let notes = try decoder.decode([Note].self, from: data)
            return notes
        } catch let error {
            print(error.localizedDescription)
        }
        return []
    }
}
extension NoteController: Equatable {
    static func == (lhs: NoteController, rhs: NoteController) -> Bool {
        return lhs.notes == rhs.notes
    }
}
