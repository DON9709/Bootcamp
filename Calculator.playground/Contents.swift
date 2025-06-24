import UIKit

class PowerOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return pow(a, b)
    }
}

class SquareRootOperation {
    func calculate(_ a: Double) -> Double {
        return a >= 0 ? Foundation.sqrt(a) : 0
    }
}

class AddOperation {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

class SubtractOperation {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
}

class MultiplyOperation {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
}

class DivideOperation {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return b != 0 ? a / b : 0
    }
}

class ModuloOperation {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return b != 0 ? a % b : 0
    }
}

class Calculator {
    let adder = AddOperation()
    let subtractor = SubtractOperation()
    let multiplier = MultiplyOperation()
    let divider = DivideOperation()
    let modulator = ModuloOperation()
    let powerer = PowerOperation()
    let rooter = SquareRootOperation()

    func add(_ a: Int, _ b: Int) -> Int {
        return adder.calculate(a, b)
    }

    func subtract(_ a: Int, _ b: Int) -> Int {
        return subtractor.calculate(a, b)
    }

    func multiply(_ a: Int, _ b: Int) -> Int {
        return multiplier.calculate(a, b)
    }

    func divide(_ a: Int, _ b: Int) -> Int {
        return divider.calculate(a, b)
    }

    func modulo(_ a: Int, _ b: Int) -> Int {
        return modulator.calculate(a, b)
    }

    func power(_ a: Double, _ b: Double) -> Double {
        return powerer.calculate(a, b)
    }

    func squareRoot(_ a: Double) -> Double {
        return rooter.calculate(a)
    }
}

let calculator = Calculator()
print(Calculator().add(69, 74))
