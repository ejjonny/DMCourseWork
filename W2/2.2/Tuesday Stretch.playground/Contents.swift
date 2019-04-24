import UIKit

protocol Vehicle: class {
	var speed: Double { get set }
	var isMoving: Bool { get set }
	func startMoving()
	func stopMoving()
}

class LawnMower: Racer {
	var speed = 100.0
	var isMoving = true
}

class Truck: Racer {
	var speed = 1.0
	var isMoving = false
}

extension Vehicle {
	
	func startMoving() {
		guard self.isMoving else { print("I'm already moving"); return }
		self.isMoving = true
		self.speed = 10.0
		print("I'm moving now")
	}
	
	func stopMoving() {
		guard !self.isMoving else { print("I'm already stopped"); return }
		self.isMoving = false
		self.speed = 0.0
		print("I'm stopped now")
	}
}

protocol Racer: Vehicle {
	func race() -> Double
}

extension Racer {
	func race() -> Double {
		return 1000.0 / speed
	}
}

let chevy = Truck()
chevy.startMoving()
print(chevy.race())

let lawn3000 = LawnMower()
lawn3000.startMoving()
lawn3000.stopMoving()
