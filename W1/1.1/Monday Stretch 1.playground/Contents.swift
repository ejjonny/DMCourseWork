import UIKit

class Person {
    var name: String
    var favoriteColor: String?
    var favoriteMovie: String?
    
    init(_ name: String) {
        self.name = name
    }
    func favoriteThings() {
        if let favoriteColor = self.favoriteColor, let favoriteMovie = self.favoriteMovie {
            print("\(self.name)'s favorite color is \(favoriteColor), and his favorite movie is \(favoriteMovie).")
        } else if let favoriteColor = self.favoriteColor{
            print("\(self.name)'s favorite color is \(favoriteColor).")
        } else if let favoriteMovie = self.favoriteMovie{
            print("\(self.name)'s favorite movie is \(favoriteMovie).")
        } else {
            print("\(self.name) doesn't like anything and hates the world")
        }
    }
}

let ethan = Person("Ethan")
ethan.favoriteColor = "Light Blue"
ethan.favoriteMovie = "Cloudy with a Chance of Meatballs"
ethan.favoriteThings()

//if let favoriteColor = ethan.favoriteColor, let favoriteMovie = ethan.favoriteMovie {
//    print("\(ethan.name)'s favorite color is \(favoriteColor), and his favorite movie is \(favoriteMovie).")
//} else if let favoriteColor = ethan.favoriteColor{
//    print("\(ethan.name)'s favorite color is \(favoriteColor).")
//} else if let favoriteMovie = ethan.favoriteMovie{
//    print("\(ethan.name)'s favorite movie is \(favoriteMovie).")
//} else {
//    print("\(ethan.name) doesn't like anything and hates the world")
//}

//let person = Person("Joe")
//person.favoriteColor = "Green"
//person.favoriteMovie = "300"
//
//if let favoriteColor = person.favoriteColor, let favoriteMovie = person.favoriteMovie {
//    print("\(person.name)'s favorite color is \(favoriteColor) and his favorite movie is \(favoriteMovie)")
//} else {
//    if let favoriteColor = person.favoriteColor {
//        print("\(person.name)'s favorite color is \(favoriteColor)")
//    } else if let favoriteMovie = person.favoriteMovie {
//        print("\(person.name)'s favorite movie is \(favoriteMovie)")
//    } else {
//        print("\(person.name) doesn't like anything")
//    }
//}
