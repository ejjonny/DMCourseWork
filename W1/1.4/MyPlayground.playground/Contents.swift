import UIKit

class Person {
    var info: [String: Any]
    var name: String
    var age: Int
    var favoriteMovie: String
    
    init?(info: [String: Any]) {
        self.info = info
        guard let name = info["nameKey"] as? String,
        let age = info["ageKey"] as? Int,
        let favoriteMovie = info["favMovieKey"] as? String
        else { return nil }
        self.name = name
        self.age = age
        self.favoriteMovie = favoriteMovie
    }
}

let goodNewPerson = Person(info: ["nameKey" : "Derek", "ageKey": 28, "favMovieKey" : "Zoolander"])
let nilPerson = Person(info: ["nameKey" : "Steve", "ageKey": 2])
