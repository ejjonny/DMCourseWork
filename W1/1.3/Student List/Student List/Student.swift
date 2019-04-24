//
//  Student.swift
//  Student List
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Student {
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    let firstName: String
    let lastName: String
    let age: Int
}

extension Student: Equatable {}

func ==(lhs: Student, rhs: Student) -> Bool {
    if lhs.firstName != rhs.firstName { return false }
    if lhs.lastName != rhs.lastName { return false }
    if lhs.age != rhs.age { return false}
    
    return true
}
