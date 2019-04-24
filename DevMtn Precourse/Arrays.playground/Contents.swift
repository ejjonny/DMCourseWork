import Cocoa

var bucketList = ["Climb Mt. Everest", "Slob on my Knob", "Fly hot air balloon to Fiji", "buns", "sauce", "neato"]
var fijiEntryIndex = 0

if let i = bucketList.firstIndex(of: "Fly hot air balloon to Fiji") {
    fijiEntryIndex = i
}

print(fijiEntryIndex)

bucketList[fijiEntryIndex+2]
print(fijiEntryIndex)

print(bucketList[fijiEntryIndex+2])
