import UIKit

//PART 1
//Make a constant called currentYear that is an integer equal to the current year (e.g. 2016).
//Create a Person struct with properties for first name as a String, last name as a String, and year of birth as an Int.
//    Create an instance of the Person struct
//Print out the instance's birth year
//Print out its first and last name
//
//PART 2
//Add a computed property for age to the Person struct
//Implement a getter for age. The getter should calculate and return the person's age based on the current year and the person's year of birth. (Hint: Look up getters in the Swift programming guide or in documentation).
//Implement a setter for age. The setter should update the year of birth based on the age and current year. (Hint: look up setters).
//Print out the person's age
//Update their age and then print their new year of birth.
//
//♦ Black Diamond
//Change your currentYear constant so that instead of being a hard-coded, static year, it uses NSDateComponents to get the actual current year anytime it runs. Documentation should help you out.

let currentYear = Calendar.current.component(.year, from: Date())

class Person {
    let firstName: String
    let lastName: String
    var birthYear: Int
    var age: Int {
        get {
            return currentYear - self.birthYear
        }
        set {
            self.birthYear = currentYear - newValue
        }
    }
    
    init(firstName: String, lastName: String, birthYear: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthYear = birthYear
    }
}

let johnny = Person(firstName: "Johnny", lastName: "Biceps", birthYear: 1999)

print(johnny.birthYear)
print(johnny.firstName, johnny.lastName)
print(johnny.age)
johnny.age = 50
print(johnny.birthYear)
