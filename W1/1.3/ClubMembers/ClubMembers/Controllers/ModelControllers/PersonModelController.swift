//
//  PersonModelController.swift
//  ClubMembers
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class PersonController {
    var people: [Person]
    static var shared = PersonController()
    
    init() {
        let james = Person(firstName: "James", lastName: "Pacheco", age: 26)
        let andrea = Person(firstName: "Andrea", lastName: "Mower", age: 24)
        let carol = Person(firstName: "Rebecca", lastName: "Mordo", age: 30)
        let joe = Person(firstName: "Joe", lastName: "Jingle", age: 25)
        let austin = Person(firstName: "Austin", lastName: "Noodle", age: 19)
        
        self.people = [james, andrea, carol, joe, austin]
    }
}

extension PersonController: Equatable {}

func == (lhs: PersonController, rhs: PersonController) -> Bool {
    if lhs.people != rhs.people { return false }
    
    return true
}
