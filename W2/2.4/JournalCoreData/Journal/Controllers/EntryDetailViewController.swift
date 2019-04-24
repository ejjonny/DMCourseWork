//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Eric Lanza on 7/5/18.
//  Copyright © 2018 ETLanza. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
	
	//MARK: - IBOutlets
	
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var bodyTextField: UITextView!
	@IBOutlet weak var goodDayBadDaySegmentedController: UISegmentedControl!
	
    override func viewDidLoad() {
        if let entry = self.entry {
            titleTextField.text = entry.title
            bodyTextField.text = entry.bodyText
			print(entry.isGoodDay)
			if entry.isGoodDay == false {
				goodDayBadDaySegmentedController.selectedSegmentIndex = 0
			} else {
				goodDayBadDaySegmentedController.selectedSegmentIndex = 1
			}
        }
    }
    
    // MARK: IBActions
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, title != "",
            let bodyText = bodyTextField.text, bodyText != ""
            else { return }
		var isGoodDay: Bool = true
		
		if goodDayBadDaySegmentedController.selectedSegmentIndex == 0 {
			isGoodDay = false
		}
		
        if let entry = self.entry {
            EntryController.shared.update(entry: entry, withNewTitle: title, andNewBody: bodyText, isGoodDay: isGoodDay)
        } else {
			EntryController.shared.createEntryWith(title: title, bodyText: bodyText, isGoodDay: isGoodDay)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
}

