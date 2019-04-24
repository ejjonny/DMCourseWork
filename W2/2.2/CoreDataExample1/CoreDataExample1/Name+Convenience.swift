//
//  Name+Convenience.swift
//  CoreDataExample1
//
//  Created by Ethan John on 1/29/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation
import CoreData

extension Person {
	convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
		self.init(context: context)
		
		self.name = name
	}
}
