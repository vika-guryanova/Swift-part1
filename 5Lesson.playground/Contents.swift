import Cocoa

enum Transmission: String, CaseIterable {
	case auto = "Автомат"
	case manual = "Механика"
}
enum EngineState: String, CaseIterable {
	case on = "Двигатель работает"
	case off = "Двигатель выключен"
}
enum WindowState: String, CaseIterable {
	case open = "Окна открыты"
	case close = "Окна закрыты"
}
enum AutomaticTrunc: String, CaseIterable {
	case open = "Багажник открыт"
	case close = "Багажник закрыт"
}
enum SportMode: String, CaseIterable {
	case on = "Спортивный режим включен"
	case off = "Спортивный режим выключен"
}
enum TrunkLoad : String, CaseIterable {
	case empty = "Кузов пустой"
	case half = "Кузов наполовину заполнен"
	case full = "Кузов полный"
}

protocol CarProtocol: class, CustomStringConvertible {
	var brand: String { get }
	var releaseYear: Int { get }
	var transmission: Transmission { get }
	var mileage: Double { get set }
	var remoteStart: EngineState { get set }
	var windowState: WindowState { get set }
	
	func switchEngineState (to value: EngineState)
	func switchWindowState (to value: WindowState)
}

extension CarProtocol {
	func switchEngineState (to value: EngineState) {
		remoteStart = value
	}
	func switchWindowState (to value: WindowState) {
		windowState = value
	}
	
	var description: String {
		return "\nАвтомобиль \(brand)\n\(releaseYear) года выпуска\nКоробка передач:  \(transmission.rawValue)\nТекущее состояние: \nПробег \(mileage) км\n\(remoteStart.rawValue)\n\(windowState.rawValue)"
	}
}

class SportCar: CarProtocol {
	let brand: String
	let releaseYear: Int
	let transmission: Transmission
	var mileage: Double
	var remoteStart: EngineState
	var windowState: WindowState
	var automaticTrunk: AutomaticTrunc
	var sportMode: SportMode

	init(brand: String, releaseYear: Int, transmission: Transmission, mileage: Double, remoteStart: EngineState, windowState: WindowState, automaticTrunk: AutomaticTrunc, sportMode: SportMode) {
		self.brand = brand
		self.releaseYear = releaseYear
		self.transmission = transmission
		self.mileage = mileage
		self.remoteStart = remoteStart
		self.windowState = windowState
		self.automaticTrunk = automaticTrunk
		self.sportMode = sportMode
	}

	func switchTrunkState(to value: AutomaticTrunc) {
		automaticTrunk = value
	}

	func switchSportMode(to value: SportMode) {
		sportMode = value
	}

}

extension SportCar {
	var sportCarDescription: String {
		return "\(description)\n\(sportMode.rawValue)\n\(automaticTrunk.rawValue)"
	}
	
}

class TrunkCar: CarProtocol {
	let brand: String
	let releaseYear: Int
	let transmission: Transmission
	var mileage: Double
	var remoteStart: EngineState
	var windowState: WindowState
	var trunkLoad: TrunkLoad

	init(brand: String, releaseYear: Int, transmission: Transmission, mileage: Double, remoteStart: EngineState, windowState: WindowState, trunkLoad: TrunkLoad) {
		self.brand = brand
		self.releaseYear = releaseYear
		self.transmission = transmission
		self.mileage = mileage
		self.remoteStart = remoteStart
		self.windowState = windowState
		self.trunkLoad = trunkLoad
	}

	func checkTrunkLoad(to value: TrunkLoad) {
		trunkLoad = value
	}
}

extension TrunkCar {
	var trunkCarDescription:  String {
		return "\(description)\n\(trunkLoad.rawValue)"
	}
}

var car1 = SportCar (brand: "Mini Cooper", releaseYear: 2021, transmission: .auto, mileage: 6.00, remoteStart: .off, windowState: .close, automaticTrunk: .close, sportMode: .off)
var car2 = SportCar (brand: "Peugeot", releaseYear: 1989, transmission: .manual, mileage: 14896.00, remoteStart: .off, windowState: .close, automaticTrunk: .close, sportMode: .off)
var car3 = TrunkCar (brand: "MAN", releaseYear: 2007, transmission: .manual, mileage: 166441.5, remoteStart: .off, windowState: .close, trunkLoad: .empty)

print(car1.sportCarDescription)
car1.switchTrunkState(to: .open)
car1.switchEngineState(to: .on)
car1.switchSportMode(to: .on)
car1.switchWindowState(to: .open)
print(car1.sportCarDescription)

print("\n\(car2.brand) - \(car2.automaticTrunk.rawValue)")

print(car3.trunkCarDescription)
car3.switchWindowState(to: .open)
car3.switchEngineState(to: .on)
car3.mileage = 3004578.1
car3.checkTrunkLoad(to: .half)
print(car3.trunkCarDescription)
