import Cocoa


var bucketList = ["Climb Mt. Everest"]
var newItems = ["Fly hot air balloon to Fiji", "Watch the LOTR trilogy in one day", "Go on a walkabout", "Scuba dive in the Great Blue Hole", "Find a triple rainbow"]

bucketList += newItems


bucketList.remove(at: 2)
bucketList
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " in Australia"
bucketList[0] = "Climb mt. Kilimanjaro"
bucketList.insert("Go tabogganing across Alaska", at: 2)
bucketList

var myronsList = {
    
}


func ageCheck() {
    var age = 30
    
    
    
    guard age < 25 else {
        
        print("A")
        
        return
        
    }
    
    
    
    if age > 35 {
        
        print("B")
        
    } else {
        
        print("C")
        
    }
}
ageCheck()

doubledNumbers = numbers.map
