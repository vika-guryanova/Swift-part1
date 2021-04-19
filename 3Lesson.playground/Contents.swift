import Foundation

enum Brand: String {
	case ford = "Ford"
	case renault = "Renault"
	case mercedes = "Mercedes"
	case kamaz = "Kamaz"
}

enum EngineCheck {
	case on, off
}

enum WindowCheck {
	case open, close
}

struct SportCar {
	let brand: Brand
	var releaseYear: Int
	var engineCheck: EngineCheck
	var windowCheck: WindowCheck
	
	mutating func startEngine() {
		self.engineCheck = .on
	}
	mutating func stopEngine() {
		self.engineCheck = .off
	}
	mutating func openWindows() {
		self.windowCheck = .open
	}
	mutating func closeWindows() {
		self.windowCheck = .close
	}
	
}

func printSportCarSpecifications(car: SportCar) {
	print("Марка автомобиля: \(car.brand)\nГод выпуска: \(car.releaseYear)\nСостояние двигателя: \(car.engineCheck)\nПроверка окон: \(car.windowCheck)\n")
}

var car1 = SportCar(brand: .ford, releaseYear: 1974, engineCheck: .off, windowCheck: .close)
var car2 = SportCar(brand: .renault, releaseYear: 1998, engineCheck: .off, windowCheck: .close)
printSportCarSpecifications(car: car1)
car2.windowCheck = .open
car2.releaseYear = 2023
printSportCarSpecifications(car: car2)

enum TrunkState: String {
	case empty = "Пусто"
	case half = "Наполовину заполнен"
	case full = "Полный"
}

struct TrunkCar {
	let brand: Brand
	let releaseYear: Int
	var engineCheck: EngineCheck
	var windowCheck: WindowCheck
	var loadWeight: Int
	
	mutating func startEngine() {
		self.engineCheck = .on
	}
	mutating func stopEngine() {
		self.engineCheck = .off
	}
	mutating func openWindows() {
		self.windowCheck = .open
	}
	mutating func closeWindows() {
		self.windowCheck = .close
	}
}

func printTrunkCarSpecifications(car: TrunkCar) {
	print("Марка автомобиля: \(car.brand)\nГод выпуска: \(car.releaseYear)\nСостояние двигателя: \(car.engineCheck)\nПроверка окон: \(car.windowCheck)\nЗаполненность багажника: \(car.loadWeight) кг")
}

var car3 = TrunkCar(brand: .mercedes, releaseYear: 2005, engineCheck: .off, windowCheck: .close, loadWeight: 9)
printTrunkCarSpecifications(car: car3)


