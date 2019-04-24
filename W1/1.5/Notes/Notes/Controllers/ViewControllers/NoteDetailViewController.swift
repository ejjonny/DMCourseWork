//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Ethan John on 1/25/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    var note: Note?
    @IBOutlet weak var noteBodyField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // If a note was passed to this View update the textView on this view when the view is about to appear.
        if let note = note {
            noteBodyField.text = note.body
        }
    }
    
    // MARK: -Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        switch (note, noteBodyField.text.isEmpty) {
        case let (.some(note), true): // If a note was passed but the field is empty when save is tapped just delete that note.
            NoteController.shared.delete(note: note)
        case (nil, true): // If there was no note passed and the field is empty just pop the view off of the stack without doing anything.
            self.navigationController?.popViewController(animated: true)
        case let (.some(note), false): // If a note was passed and the textField has contents update the passed note.
            NoteController.shared.update(note: note, withBody: noteBodyField.text)
        case (nil, false): // If no note was passed and the textField has contents create a note.
            NoteController.shared.createNote(body: noteBodyField.text)
        }
        
        // Pop view controller to return to note list.
        self.navigationController?.popViewController(animated: true)
    }
}
