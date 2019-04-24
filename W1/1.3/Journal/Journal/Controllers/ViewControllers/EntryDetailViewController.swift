//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    @IBOutlet weak var entryTitleField: UITextField!
    @IBOutlet weak var entryBodyField: UITextView!
    
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        entryTitleField.text = entry?.title
        entryBodyField.text = entry?.body
    }
    
    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        
        // Unwrap field contents and make sure they are not empty.
        guard let title = entryTitleField.text,
            let body = entryBodyField.text 
            else { return }
        
        // Depending on whether you are editing an entry: update an entry or add an entry.
        if let entry = entry {
            // If an entry object is sent from segue we can assume the user is editing
            EntryController.shared.update(entry: entry, withTitle: title, andBody: body)
            self.dismiss(animated: true, completion: nil)
        } else {
            // If an entry object is not sent the user is creating an entry
            EntryController.shared.addEntry(withTitle: title, withText: body)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelEntryButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
