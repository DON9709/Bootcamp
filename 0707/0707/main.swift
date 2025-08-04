//
//  main.swift
//  0707
//
//  Created by 이돈혁 on 7/7/25.
//

//1
import Foundation

class Animal {
    func makeSound() {
        print("Animal sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Bark")
    }
}

let dog = Dog()
dog.makeSound()

//2
func calculate(a: Int, b: Int) -> Int {
    return a + b
}

func calculate(a: Double, b: Double) -> Double {
    return a + b
}

func calculate(a: Int, b: Int, ex: String) -> Int {
    switch ex {
    case "+": return a + b
    case "-": return a - b
    case "*": return a * b
    case "/": return a / b
    default: return 0
    }
}

print(calculate(a: 10, b: 20))
print(calculate(a: 0.5, b: 0.5))
print(calculate(a: 10, b: 20, ex: "*"))
