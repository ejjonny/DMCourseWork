import UIKit

class Car {
    var make: String
    var model: String
    var year: Int
    var vin: String
    
    init(make: String, model: String, year: Int, vin: String) {
        self.make = make
        self.model = model
        self.year = year
        self.vin = vin
    }
}

let accord = Car(make: "Honda", model: "Accord", year: 2011, vin: "1ASDBK432874TYGB34IG")

let f150 = Car(make: "Ford", model: "F150", year: 2015, vin: "1ASDBK432879TYGB34IG")

let elantra = Car(make: "Hyundai", model: "Elantra", year: 2017, vin: "1ASDBK43F874TYGB34IG")

let secondAccord = Car(make: "Honda", model: "Accord", year: 2011, vin: "1ASDBK432874TYGB34IG")

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.make == rhs.make &&
        lhs.model == rhs.model &&
        lhs.year == rhs.year &&
        lhs.vin == rhs.vin
    }
}

