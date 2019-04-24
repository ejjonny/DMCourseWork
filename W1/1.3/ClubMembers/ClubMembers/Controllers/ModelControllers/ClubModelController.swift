//
//  ClubModelController.swift
//  ClubMembers
//
//  Created by Ethan John on 1/23/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class ClubController {
    
    var members: [Person]
    
    init() {
        self.members = PersonController.shared.people
    }
    
    func hasMember(member: Person, inClub club: Club) -> Bool {
        if self.members.contains(member) { return true }
        return false
    }
}
