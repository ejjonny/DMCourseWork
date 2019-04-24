import UIKit

class Person {
    let firstName: String
    let lastName: String
    let age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
extension Person: Equatable {}

func == (lhs: Person, rhs: Person) -> Bool {
    if lhs.firstName != rhs.firstName { return false }
    if lhs.lastName != rhs.lastName { return false }
    if lhs.age != rhs.age { return false }
    return true
}

let james = Person(firstName: "James", lastName: "Pacheco", age: 26)
let andrea = Person(firstName: "Andrea", lastName: "Mower", age: 24)
let carol = Person(firstName: "Rebecca", lastName: "Mordo", age: 30)
let joe = Person(firstName: "Joe", lastName: "Jingle", age: 25)
let austin = Person(firstName: "Austin", lastName: "Noodle", age: 19)

let clubMembers: [Person] = [james, andrea, carol, joe]

func checkMembership(inClub club: [Person], ofPerson person: Person) -> Bool {
    for member in club {
        if person == member {
            return true
        }
    }
    return false
}

checkMembership(inClub: clubMembers, ofPerson: austin)
