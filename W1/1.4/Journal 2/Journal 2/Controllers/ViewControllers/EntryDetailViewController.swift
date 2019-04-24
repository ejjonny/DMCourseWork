//
//  EntryDetailViewController.swift
//  Journal 2
//
//  Created by Ethan John on 1/24/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, let body = bodyTextView.text else { return }
        if let entry = entry {
            EntryController.shared.update(entry: entry, withTitle: title, andBody: body)
        } else if let title = titleTextField.text, let body = bodyTextView.text {
            EntryController.shared.addEntry(withTitle: title, withText: body)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let entry = entry else {
            self.title = "New Note"
            return
        }
        self.title = entry.title
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
}
