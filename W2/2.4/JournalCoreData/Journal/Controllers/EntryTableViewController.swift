//
//  EntryTableViewController.swift
//  Journal
//
//  Created by Eric Lanza on 7/5/18.
//  Copyright © 2018 ETLanza. All rights reserved.
//

import UIKit
import CoreData

class EntryTableViewController: UITableViewController {
	
	let fetchedResultsController: NSFetchedResultsController<Entry> = {
		let request: NSFetchRequest<Entry> = Entry.fetchRequest()
		let goodDaySort = NSSortDescriptor(key: "isGoodDay", ascending: false)
		let timeSort = NSSortDescriptor(key: "timeStamp", ascending: false)
		request.sortDescriptors = [goodDaySort, timeSort]
		
		return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isGoodDay", cacheName: nil)
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
		do {
			try fetchedResultsController.performFetch()
		} catch {
			print(error.localizedDescription)
		}
		fetchedResultsController.delegate = self
    }
    
    // MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return fetchedResultsController.sections?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return fetchedResultsController.sectionIndexTitles[section] == "0" ? "Bad Day" : "Good Day"
	}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let entry = fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			let entry = fetchedResultsController.object(at: indexPath)
            EntryController.shared.remove(entry: entry)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editEntrySegue" {
            guard let destinationVC = segue.destination as? EntryDetailViewController else { return }
            guard let indexForEntry = tableView.indexPathForSelectedRow else { return }
            destinationVC.entry = fetchedResultsController.object(at: indexForEntry)
        }
    }
}
