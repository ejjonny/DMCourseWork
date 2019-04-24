//
//  ViewController.swift
//  CoreDataExample1
//
//  Created by Ethan John on 1/29/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
	
	@IBOutlet weak var nameField: UITextField!
	
	var name: String = ""
	var people: [Person] {
		let request: NSFetchRequest<Person> = Person.fetchRequest()
		do {
			return try CoreDataStack.context.fetch(request)
		} catch {
			print(error)
			return []
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	@IBAction func saveButtonTapped(_ sender: UIButton) {
		guard let name = nameField.text else { print("Name was nil?"); return }
		Person(name: name, context: CoreDataStack.context)
		saveToPersistentStorage()
	}
	
	func saveToPersistentStorage() {
		do {
			try CoreDataStack.context.save()
		} catch let error {
			print("There was an error saving to persistent storage: \(error)")
		}
	}
}

