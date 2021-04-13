//
//  2Lesson.swift
//  
//
//  Created by Victoria Guryanova on 12.04.2021.
//

import Foundation

//MARK: - 1. Написать функцию, которая определяет, четное число или нет
func isEven(_ number: Int) -> Bool {
	return number % 2 == 0
}


//MARK: - 2. Написать функцию, которая определяет, делится ли число без остатка на 3
func isDividedByThree(_ number: Int) -> Bool {
	return number % 3 == 0
}


//MARK: - 3. Создать возрастающий массив из 100 чисел
var arr: [Int] = []

for i in 1...100 {
	arr.append(i)
}


//MARK: - 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3
for item in arr {
	if isEven(item) || !isDividedByThree(item) {
		if let index = arr.firstIndex(of: item) {
			arr.remove(at: index)
		}
	}
}

print(arr)


//MARK: - 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов
var fibonacciNumber = [Decimal]()

func fibonacciNumberGenerator(for array: inout [Decimal]) {
	switch array.count {
		case 0, 1:
			array.append(1)
		default:
			let penultimateNumber: Decimal = array[array.count - 2]
			let lastNumber: Decimal = array[array.count - 1]
			array.append(penultimateNumber + lastNumber)
	}
}

for _ in 1...50 {
	fibonacciNumberGenerator(for: &fibonacciNumber)
}

print(fibonacciNumber)


//MARK: - 6. Заполнить массив из 100 элементов различными простыми числами
func isPrimeNumber(_ n: Int) -> Bool {
	if n <= 1 {
		return false
	}
	
	if n <= 3 {
		return true
	}
	
	var i: Int = 2
	
	while i * i <= n {
		if n % i == 0 {
			return false
		}
		
		i += 1
		
	}

	return true
}
				
var i: Int = 0
var primeNumber = [Int]()

while primeNumber.count <= 100  {
	if isPrimeNumber(i) {
		primeNumber.append(i)
	}
	
	i += 1
}

print(primeNumber)
