import UIKit

class Vehicle {
	var currentSpeed = 0.0
	var description: String {
		return "traveling at \(currentSpeed) miles per hour"
	}
	
	func mkaeNoise() {
		//
	}
}

let someVehivle = Vehicle()
print("Vehicle: \(someVehivle.description)")

// 현재 디스크립션 0.0 첫 설정과 그대로

class Bicycle: Vehicle {
	var hasBasket = false
}

// Vehicle 속성, 메소드 + hasBasket도 가짐

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
	var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Train: Vehicle {
	override func mkaeNoise() {
		print("Choo Choo")
	}
}

let train = Train()

train.mkaeNoise()

class Car: Vehicle {
	var gear = 1
	override var description: String {
		return super.description + " in gear \(gear)"
	}
}

let car = Car()

car.description
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
	override var currentSpeed: Double {
		didSet {
			gear = Int(currentSpeed / 10.0) + 1
		}
	}
}

let automatic = AutomaticCar()
automatic.currentSpeed = 30.0
print("AutomaticCar: \(automatic.description)")
