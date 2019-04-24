import Cocoa

class EvenInt {
    
    let value: Int
    
    init?(value: Int) {
        if value % 2 != 0 {return nil}
        self.value = value
    }
}

let oddInt = EvenInt.init(value: 6)

struct Course {
  var name: String
  var studentNames: [String]
  var isOnlineCourse: Bool
}

var smd101 = Course(name: "English 101", studentNames: ["Jason", "Bernie"], isOnlineCourse: true)
smd101.isOnlineCourse = false

class Mountain {
    
    let name: String
    let summit: Double
    let base: Double
    let climbDate: Date
    
    init(name: String, summit: Double, base: Double, climbDate: Date = Date()) {
        self.name = name
        self.summit = summit
        self.base = base
        self.climbDate = climbDate
    }
}

let timp = Mountain(
