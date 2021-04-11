//
//  1Lesson.swift
//  L1_Гурьянова Виктория
//
//  Created by Victoria Guryanova on 23.03.2021.
//

import Foundation

// 1. Решить квадратное уравнение ax2 + bx + c = 0

// Находим a, b, c
let a: Double = 3.0
let b: Double = 10.0
let c: Double = 5.0

// Записываем формулу Дискриминанта D=b2-4ac
let D: Double = pow(b, 2) - 4 * a * c

var x1: Double
var x2: Double

if (D > 0){
	x1 = -b + sqrt(D) / (2 * a)
	x2 = -b - sqrt(D) / (2 * a)
	print("Уравнение имеет 2 корня:\nx1 = \(x1)\nx2 = \(x2)")
} else if (D == 0){
	x1 = -b / (2 * a)
	print("Уравнение имеет 1 корень:\nx1 = \(x1)")
} else {
	print("Нет действительных корней")
}



// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let cathet1: Double = 10.0
let cathet2: Double = 8.0

let square: Double = cathet1 * cathet2 / 2
let hypotenuse: Double = sqrt(pow(cathet1, 2) + pow(cathet2, 2))
let perimeter: Double = cathet1 + cathet2 + hypotenuse

print("\nПри заданных катетах \(cathet1) и \(cathet2) гипотенуза равна \(String.init(format: "%.2f", hypotenuse)), площадь равна \(square)")


// 3. Калькулятор вкладов.

var deposit: Double = 100_000.0
let percent: Double = 15.0
var years: Int = 5

for _ in 1...years{

	deposit = (deposit * (percent / 100)) + deposit

}

print("\nСумма вклада через \(years) лет составит \(Int(floor(deposit))) руб. \(Int(((deposit.truncatingRemainder(dividingBy: 1)) * 100))) коп.")







