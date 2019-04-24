//
//  Person+Convenience.swift
//  technicalChallengeWeek6
//
//  Created by Ethan John on 3/8/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import CoreData

extension Person {
	@discardableResult
	convenience init(name: String, moc: NSManagedObjectContext = CoreDataStack.context) {
		self.init(context: moc)
		self.name = name
	}
}
