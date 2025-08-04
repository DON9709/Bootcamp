//
//  main.swift
//  0711
//
//  Created by 이돈혁 on 7/11/25.
//

//
//### 필수 문제 1
//
//- [ ]  두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
//- 클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환합니다.
//- [ ]  이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요.
//
//```swift
//var num: Int = 3
//```
//
//- [ ]  sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
//- [ ]  위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
//1. (조건) calculate 함수 구현 내에서는 파라미터로 전달받은 클로저를 호출하는 코드를 포함해야합니다.
//
//- [ ]  아래 for-in 문을 map 을 사용하는 코드로 변환해주세요.
//
//```swift
//let numbers = [1, 2, 3, 4, 5]
//
//var result = [String]()
//
//for number in numbers {
//result.append(number)
//}
//```
//
//- [ ]  주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
//- 입력: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - 타입: Array<Int>
//- 출력: [”2”, “4”, “6”, “8”, “10”] - 타입: Array<String>
//- 힌트
//
//map 과 filter 를 이용해볼 수 있을 것 같습니다.
//
//- [ ]  이제 고차함수를 직접 만들어 봅니다.
//- 함수명: myMap
//- 파라미터는 2개 입니다.
//1. 배열: [Int]
//2. 변환 클로저: (Int) → String
//- 반환 값은 1개 입니다.
//1. [String]
//- myMap 함수 구현 내부에서 map, filter, reduce 등 고차함수를 직접 사용하지 않아야합니다.
//- 완성된 myMap 호출 예시
//
//```swift
//let result = myMap([1, 2, 3, 4, 5]) {
//    String($0)
//}
//
//print(result) // ["1", "2", "3", "4", "5"]
//```

//### 필수 문제 3
//
//- [ ]  Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 `a` 를 작성해주세요.
//    - 테스트 입력: [1, 2, 3, 4, 5]
//    - 테스트 출력: [1, 3, 5]
//- [ ]  String 배열의 짝수번째 요소를 제거해서 반환하는 함수 `b` 를 작성해주세요.
//    - 테스트 입력: [”가”, “나”, “다”, “라”, “마”]
//    - 테스트 출력: [”가”, “다”, ”마”]
//- [ ]  위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 `c` 로 작성해주세요.
//- [ ]  테스트 입력들을 넣고 호출하여 출력이 제대로 나오는지 작성해주세요.
//    - 테스트 입력: [1, 2, 3, 4, 5], [”가”, “나”, “다”, “라”, “마”]
//    - 테스트 출력: [1, 3, 5], [”가”, “다”, ”마”]
//- [ ]  함수 `c` 를 기반으로 수정하여 함수 `d` 를 작성해주세요.
//    - 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.

//### 필수 문제 4
//
//우리는 여러 타입에 “자기소개” 기능을 부여하고자 합니다.
//
//- [ ]  Introducible 프로토콜을 정의하세요.
//    - name: String 프로퍼티를 요구사항으로 포함합니다.
//    - introduce() -> String 메서드를 요구사항으로 포함합니다.
//        - 동작 예시: print("안녕하세요, 저는 \(name)입니다.")
//- [ ]  Robot, Cat, Dog 타입을 정의하고 Introducible 프로토콜을 채택해주세요.
//- [ ]  Robot 타입의 경우, name 값이 변경될 때마다 변경 이전값과 이후 값을 출력하도록 구현해주세요.
//    - 만약 변경 이전값과 이후값이 같다면 출력하지 않아야합니다.
//    - 출력 예시
//        
//        ```swift
//        name 변경 알림
//        변경 이전 값: 피규어
//        변경 이후 값: 옵티머스
//        ```
//        
//- [ ]  Introducible 프로토콜 에 정의되지 않은 각 타입 고유의 메서드들도 하나씩 추가 정의해주세요.
//    - 예를 들어, Robot 은 충전하기(batteryCharge) 라는 메서드를 추가 할 수 있습니다.
//- [ ]  `[Introducible]` 타입 배열을 정의하고, Robot, Cat, Dog 인스턴스 1개씩을 append 해주세요.
//    - 배열을 순회하며 각 타입 고유의 메서드들을 호출하는 코드를 작성해주세요.

import Foundation

let sum: (Int, Int) -> String = { a, b in
    let total = a + b
    return "두 수의 합은 \(total)입니다"
}

let result = sum(10, 20)
print(result)

func calculate(using closure: (Int, Int) -> String) {
    let outcome = closure(10, 20)
    print(outcome)
}

let numbers = [1, 2, 3, 4, 5]
let resultMap = numbers.map { String($0) }
print(resultMap)

let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evenStrings = input.filter { $0 % 2 == 0 }.map { String($0) }
print(evenStrings)

func myMap(_ array: [Int], using transform: (Int) -> String) -> [String] {
    var result = [String]()
    for element in array {
        result.append(transform(element))
    }
    return result
}

let mappedResult = myMap([1, 2, 3, 4, 5]) { String($0) }
print(mappedResult)

func a(_ array: [Int]) -> [Int] {
    return array.enumerated().compactMap { index, element in
        return index % 2 == 0 ? element : nil
    }
}
print(a([1, 2, 3, 4, 5]))

func b(_ array: [String]) -> [String] {
    return array.enumerated().compactMap { index, element in
        return index % 2 == 0 ? element : nil
    }
}
print(b(["가", "나", "다", "라", "마"]))

func c<T>(_ array: [T]) -> [T] {
    return array.enumerated().compactMap { index, element in
        return index % 2 == 0 ? element : nil
    }
}
print(c([1, 2, 3, 4, 5]))
print(c(["가", "나", "다", "라", "마"]))

func d<T: Numeric>(_ array: [T]) -> [T] {
    return array.enumerated().compactMap { index, element in
        return index % 2 == 0 ? element : nil
    }
}
print(d([1, 2, 3, 4, 5]))


protocol Introductible {
    var name: String { get set }
    func introduce() -> String
}

class Robot: Introductible {
    var name: String {
        didSet {
            if oldValue != name {
                print("name 변경 알림")
                print("변경 이전 값: \(oldValue)")
                print("변경 이후 값: \(name)")
            }
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }
    
    func batteryCharge() {
        print("\(name): 배터리를 충전중입니다.")
    }
}

struct Cat: Introductible {
    var name: String
    
    func introduce() -> String {
        return "야옹, 저는 \(name)입니다."
    }
    
    func meow() {
        print("\(name): 야옹")
    }
}

struct Dog: Introductible {
    var name: String
    
    func introduce() -> String {
        return "ruff ruff, 저는 \(name)입니다."
    }
    
    func bark() {
        print("\(name): ruff")
    }
}

var pets: [Introductible] = []

let robot = Robot(name: "ROB-1")
let cat = Cat(name: "야옹이")
let dog = Dog(name: "강아지")

pets.append(robot)
pets.append(cat)
pets.append(dog)

for pet in pets {
    print(pet.introduce())
    
    if let robot = pet as? Robot {
        robot.batteryCharge()
    } else if let cat = pet as? Cat {
        cat.meow()
    } else if let dog = pet as? Dog {
        dog.bark()
    }
}

protocol Introducible {
    var name: String { get set }
    func introduce() -> String
}

class Robot: Introducible {
    var name: String
        disSet {
            if oldValue != name {
                print("name 변경")
                print( "변경 이전 값: \(oldValue)")
                print("변경 이후 값: \(name)")
            }
        }
    }
