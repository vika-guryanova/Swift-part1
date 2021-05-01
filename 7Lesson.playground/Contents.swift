import UIKit

struct User {
	let name: String
	let email: String
	let password: String
}

enum FacebookError: Error {
	case invalidUserName
	case invalidEmailAdderss
	case invalidPassword
	case userAlreadyExists
	case passwordTooWeak
	case userNotFound
	
	var localizedDescription: String {
		switch self {
		case .invalidUserName:
			return "Неправильное имя пользователя"
		case .invalidEmailAdderss:
			return "Некорректный email"
		case .invalidPassword:
			return "Неправильный пароль"
		case .userAlreadyExists:
			return "Пользователь с указанным email-адресом уже существует"
		case .passwordTooWeak:
			return "Пароль должен содержать не менее 6 символов"
		case .userNotFound:
			return "Пользователь не найден"
		}
	}
}

extension FacebookError: CustomStringConvertible {
	var description: String { self.localizedDescription }
}

class Facebook {
	var users: [String: User] = [:]
	
	func signup(name: String, email: String, password: String) -> Error? {
		guard name != "" else {
			return FacebookError.invalidUserName
		}
		
		guard email != "" else {
			return FacebookError.invalidEmailAdderss
		}
		
		guard !self.isUserExists(email: email) else {
			return FacebookError.userAlreadyExists
		}
		
		guard password != "" else {
			return FacebookError.invalidPassword
		}
		
		guard password.count >= 6 else {
			return FacebookError.passwordTooWeak
		}
		
		let user = User(name: name, email: email, password: password)
		users[email] = user
		
		return nil
	}
	
	func login(email: String, password: String) -> (user: User?, error: Error?) {
		guard isUserExists(email: email) else {
			return (nil, FacebookError.userNotFound)
		}
		
		let user = users[email]!
		guard user.password == password else {
			return (nil, FacebookError.invalidPassword)
		}
		
		return (user, nil)
	}
	
	func postToTimeline(user: User, message: String) throws {
		
		guard users[user.email] != nil else {
			throw FacebookError.userNotFound
		}
		
		guard users[user.email]!.password == user.password else {
			throw FacebookError.invalidPassword
		}
		
		print("Пользователь \(user.name) опубликовал новую запись: \(message)")
	}
	
	private func isUserExists(email: String) -> Bool {
		return users[email] != nil
	}
}

let f = Facebook()
if let error = f.signup(name: "", email: "foo@bar.com", password: "123123") {
	print("Signup error: \(error)")
}
f.signup(name: "John", email: "", password: "123123")
f.signup(name: "John", email: "foo@bar.com", password: "")
f.signup(name: "John", email: "foo@bar.com", password: "123")
f.signup(name: "John", email: "foo@bar.com", password: "123123")
f.signup(name: "John", email: "foo@bar.com", password: "123123")
f.signup(name: "Peter", email: "peter@gmail.com", password: "123345")

let (user, error) = f.login(email: "peter@gmail.com", password: "123345")
if error != nil {
	print("Login error: \(error!)")
}

do {
	try f.postToTimeline(user: user!, message: "Hello, World!")
	try f.postToTimeline(user: User(name: "xxx", email: "zzz", password: "123"), message: "Hello, World!")
} catch FacebookError.userNotFound {
	print("Пользователь не существует")
} catch FacebookError.invalidPassword {
	print("Пароль указан неверно")
} catch {
	print("Неизвестная ошибка")
}
