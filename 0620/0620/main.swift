//
//  main.swift
//  0620
//
//  Created by 이돈혁 on 6/20/25.
//

import Foundation

//1
class Vehicle {}
class Car: Vehicle {}

let vehicle = Car()
let isCar = vehicle is Car
print(isCar)

//2
class ElectronicDevice {}
class Computer: ElectronicDevice {
    func startup() {
        print("Computer started")
    }
}

let equipment: ElectronicDevice = Computer()
if let computer = equipment as? Computer {
    computer.startup()
}
    
//3
class Shape{}
class Rectangle: Shape {
    func getWidth() -> Double {
        return 15.5
    }
}

//4
class Vehicle1 {
    func startEngine() {
        print("Engine started")
    }
}
class Motorcycle: Vehicle1 {}

let sportBike: Motorcycle = Motorcycle()

let generalVehicle: Vehicle1 = sportBike
generalVehicle.startEngine()

//5
class Employee {}
class Manager: Employee {}

var employees = [Employee(), Employee(), Employee(), Manager()]
let managerOnly = employees.compactMap { employee in
    return employee as? Manager
}
print(managerOnly)


