//
//  CoreDataStack.swift
//  technicalChallengeWeek6
//
//  Created by Ethan John on 3/8/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
	
	static let container: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "technicalChallengeWeek6")
		container.loadPersistentStores() { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		}
		return container
	}()
	
	static var context: NSManagedObjectContext { return container.viewContext }
}
