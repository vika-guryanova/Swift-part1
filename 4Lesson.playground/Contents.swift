import Foundation

enum Transmission: String {
	case auto = "Автомат"
	case manual = "Механика"
}
enum EngineState: String {
	case on = "Двигатель работает"
	case off = "Двигатель выключен"
}
enum WindowsState: String {
	case open = "Окна открыты"
	case close = "Окна закрыты"
}
enum AutomaticTrunc: String {
	case open = "Багажник открыт"
	case close = "Багажник закрыт"
}
enum SportMode: String {
	case on = "Спортивный режим включен"
	case off = "Спортивный режим выключен"
}
enum TrunkLoad : String {
	case empty = "Кузов пустой"
	case half = "Кузов наполовину заполнен"
	case full = "Кузов полный"
}

class Car {
	let brand: String
	let releaseYear: Int
	let transmission: Transmission
	var mileage: Double
	var remoteStart: EngineState
	var windowsState: WindowsState
	
	init(brand: String, releaseYear: Int, transmission: Transmission, mileage: Double, remoteStart: EngineState, windowsState: WindowsState) {
		self.brand = brand
		self.releaseYear = releaseYear
		self.transmission = transmission
		self.mileage = mileage
		self.remoteStart = remoteStart
		self.windowsState = windowsState
	}
	
	func switchEngineState (to value: EngineState) {}
	func switchWindowsState (to value: WindowsState) {}
}

class SportCar: Car {
	var automaticTrunk: AutomaticTrunc
	var sportMode: SportMode
	
	init(brand: String, releaseYear: Int, transmission: Transmission, mileage: Double, remoteStart: EngineState, windowsState: WindowsState, automaticTrunk: AutomaticTrunc, sportMode: SportMode) {
		self.automaticTrunk = automaticTrunk
		self.sportMode = sportMode
		
		super.init(brand: brand, releaseYear: releaseYear, transmission: transmission, mileage: mileage, remoteStart: remoteStart, windowsState: windowsState)
	}
	
	func switchTrunkState(to value: AutomaticTrunc) {
		automaticTrunk = value
	}
	
	func switchSportMode(to value: SportMode) {
		sportMode = value
	}
	
	func printSportCarDetails() {
		print("\nСпортивный автомобиль \(self.brand)")
		print("\(self.releaseYear) года выпуска")
		print("Коробка передач:  \(self.transmission.rawValue)")
		print("Текущее состояние: \nПробег \(self.mileage) км")
		print(self.sportMode.rawValue)
		print(self.automaticTrunk.rawValue)
		print(self.remoteStart.rawValue)
		print(self.windowsState.rawValue)
	}
	
	override func switchEngineState(to value: EngineState) {
		remoteStart = value
	}
	
	override func switchWindowsState(to value: WindowsState) {
		windowsState = value
	}
}

class TrunkCar: Car {
	var trunkLoad: TrunkLoad
	
	init(brand: String, releaseYear: Int, transmission: Transmission, mileage: Double, remoteStart: EngineState, windowsState: WindowsState, trunkLoad: TrunkLoad) {
		self.trunkLoad = trunkLoad
		
		super.init(brand: brand, releaseYear: releaseYear, transmission: transmission, mileage: mileage, remoteStart: remoteStart, windowsState: windowsState)
	}
	
	func checkTrunkLoad(to value: TrunkLoad) {
		trunkLoad = value
	}
	
	func printTrunkCarDetails() {
		print("\nГрузовой автомобиль \(self.brand)")
		print("\(self.releaseYear) года выпуска")
		print("Коробка передач:  \(self.transmission.rawValue)")
		print("Текущее состояние: \nПробег \(self.mileage) км")
		print(self.remoteStart.rawValue)
		print(self.windowsState.rawValue)
		print(self.trunkLoad.rawValue)
	}
	
	override func switchEngineState(to value: EngineState) {
		remoteStart = value
	}
	
	override func switchWindowsState(to value: WindowsState) {
		windowsState = value
	}
}

var car1 = SportCar (brand: "Mini Cooper", releaseYear: 2021, transmission: .auto, mileage: 6.00, remoteStart: .off, windowsState: .close, automaticTrunk: .close, sportMode: .off)
var car2 = SportCar (brand: "Peugeot", releaseYear: 1989, transmission: .manual, mileage: 14896.00, remoteStart: .off, windowsState: .close, automaticTrunk: .close, sportMode: .off)
var car3 = TrunkCar (brand: "MAN", releaseYear: 2007, transmission: .manual, mileage: 166441.5, remoteStart: .off, windowsState: .close, trunkLoad: .empty)

car1.printSportCarDetails()
car2.printSportCarDetails()
car3.printTrunkCarDetails()

car1.switchEngineState(to: .on)
car1.switchWindowsState(to: .open)
car1.switchSportMode(to: .on)
car1.switchTrunkState(to: .open)
car1.printSportCarDetails()

car3.switchEngineState(to: .on)
car3.switchWindowsState(to: .open)
car3.checkTrunkLoad(to: .full)
car3.printTrunkCarDetails()
