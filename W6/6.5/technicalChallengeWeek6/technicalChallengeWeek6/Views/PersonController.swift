//
//  PersonController.swift
//  technicalChallengeWeek6
//
//  Created by Ethan John on 3/8/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import CoreData

class PersonController {
	// Mark: - Singleton
	static let shared = PersonController()
	
	// Mark: - Source of truth
	var people: [Person] = []
	var groupCount: Int {
		if people.count % 2 == 0 {
			return people.count / 2
		} else {
			return people.count / 2 + 1
		}
	}
	var groups: [[Person]] {
		var pairs: [[Person]] = []
		var pairIndex = 0
		for person in people {
			if pairs.indices.contains(pairIndex) {
				let count = pairs[pairIndex].count
				if count < 2 {
					pairs[pairIndex].append(person)
				} else {
					pairs.append([person])
					pairIndex += 1
				}
			} else {
				pairs.append([person])
			}
		}
		return pairs
	}
	
	// Mark: - People control
	func shufflePeople() {
		people.shuffle()
		// Didn't have time to make a prng if we were supposed to
//		for person in people {
//			guard let index = people.index(of: person) else { return }
//			people.remove(at: index)
//			people.insert(person, at: <#T##Int#>)
//		}
	}
	
	func addPerson(name: String) {
		let person = Person(name: name)
		saveToPersistentStore()
		people.append(person)
	}
	
	func delete(person: Person, completion: @escaping (Bool) -> Void) {
		CoreDataStack.context.delete(person)
		saveToPersistentStore()
		guard let index = people.index(of: person) else { completion(false) ; return }
		people.remove(at: index)
		completion(true)
	}
	
	// Mark: - Persistence
	func saveToPersistentStore() {
		do {
			try CoreDataStack.context.save()
		} catch {
			print("Unable to save to persistent store.",error, error.localizedDescription)
		}
	}
	
	func loadFromPersistentStore() {
		
		let personFetchResultsController: NSFetchedResultsController<Person> = {
			let request = NSFetchRequest<Person>(entityName: "Person")
			let groupSort = NSSortDescriptor(key: "name", ascending: true)
			request.sortDescriptors = [groupSort]
			return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
		}()
		do {
			try personFetchResultsController.performFetch()
			guard let personResults = personFetchResultsController.fetchedObjects else { print("Unable to fetch") ; PersonController.shared.people = [] ; return }
			self.people = personResults
		} catch {
			print("Unable to load from pesistent store",error, error.localizedDescription)
		}
	}
}
