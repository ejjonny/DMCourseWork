import Cocoa

for i in 1...100 {
    switch true {
    case ((i % 3 == 0) && (i % 5 == 0)):
        print("DevMountain")
    case i % 3 == 0:
        print("Dev")
    case i % 5 == 0:
        print("Mountain")
    default:
        print(i)
    }
}
