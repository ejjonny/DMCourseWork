//
//  StudentController.swift
//  Student List
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class StudentController {
    
    init() {
        self.students = [
            Student(firstName: "Ethan", lastName: "John", age: 21),
            Student(firstName: "Steve", lastName: "Jobs", age: 62),
            Student(firstName: "Johnny", lastName: "Appleseed", age: 26)
        ]
    }
    
    func create(studentWithFirstName firstName: String, lastName: String, age: Int) -> Student {
        let student = Student(firstName: firstName, lastName: lastName, age: age)
        self.students.append(student)
        return student
    }
    
    func delete(student: Student) {
        if let index = self.students.index(where: { $0 == student } ) {
            self.students.remove(at: index)
        }
    }
    
    var students: [Student]
}
