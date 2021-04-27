import Cocoa

//MARK: Создаем электронную очередь на прием ко врачу

enum Gender: String {
	case male = "Мужской"
	case female = "Женский"
}
enum Status: String {
	case initialVisit = "Первичный визит"
	case repeatVisit = "Повторный визит"
}

class Patient {
	let name: String
	var gender: Gender
	var status: Status
	
	init(name: String, gender: Gender, status: Status) {
		self.name = name
		self.gender = gender
		self.status = status
	}
}

extension Patient: CustomStringConvertible {
	var description: String {
		var action: String = "пришел"
		if gender == Gender.female {
			action = "пришла"
		}
		return "Пациент \(name) \(action) на \(status.rawValue.lowercased())"
	}
}

struct Queue<T> {
	private var elements: [T] = []
	
	mutating func push(_ element: T) {
		elements.append(element)
	}
	
	mutating func shift() -> T? {
		guard elements.count > 0 else { return nil }
		return elements.removeFirst()
	}
	
	func filter(callback: (T) -> Bool) -> [T] {
		elements.filter(callback)
	}
	
	func each(callback: (Int, T) -> Void) {
		for (index, element) in elements.enumerated() {
			callback(index, element)
		}
	}
}

//Отсортировать из общей очереди пациентов, пришедших на повторный визит
func isRepeatedVisit(_ patient: Patient) -> Bool {
	return patient.status == Status.repeatVisit
}

////Вывести имена всех пациентов в очереди
//func allNames(_ index: Int, element: Patient) {
//	print(element.name)
//}

var queue: Queue<Patient> = Queue()
var removePatient = {
	if let patient = queue.shift() {
		print("Пациента \(patient.name) вызвали в кабинет врача")
	}
}

extension Queue {
	subscript(index: Int) -> T? {
		guard index >= 0 && index < elements.count else {
			return nil
		}
		return elements[index]
	}
}

queue.push(Patient(name: "Олег", gender: Gender.male, status: Status.initialVisit))
queue.push(Patient(name: "Макар", gender: Gender.male, status: Status.repeatVisit))
queue.push(Patient(name: "Илья", gender: Gender.male, status: Status.initialVisit))
queue.push(Patient(name: "Анна", gender: Gender.female, status: Status.repeatVisit))
queue.push(Patient(name: "Карина", gender: Gender.female, status: Status.repeatVisit))
queue.push(Patient(name: "Иван", gender: Gender.male, status: Status.initialVisit))
queue.each(callback: {_, patient in print(patient)}) //Выводим список всех пациентов в очереди
removePatient()
print(queue.filter { $0.status == Status.initialVisit }) //Выводим список пациентов, пришедших на первичный прием
print(queue.filter(callback: isRepeatedVisit)) //Выводим список пациентов, пришедших на повторный прием
queue[2]
queue[9]

