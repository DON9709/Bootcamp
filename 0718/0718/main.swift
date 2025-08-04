//
//  main.swift
//  0718
//
//  Created by 이돈혁 on 7/18/25.
//

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
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }
    
    func batteryCharge() {
        print("충전 중...")
    }
}

class Cat: Introducible {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "야옹, 저는 \(name)입니다."
    }
    func meow() {
        print("야옹")
    }
}

class Dog: Introducible {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "ruff ruff, 저는 \(name)입니다."
    }
    func woof() {
        print("ruff ruff")
    }
}

var pets: [Introducible] = []
    Robot(name: "피규어"),
    Cat(name: "고양이"),
    Dog(name: "강아지")
]

fot pet in pets {
    print(pet.introduce())
    
    if let robot = pet as? Robot {
        robot.batteryCharge()
    } else if let cat = pet as? Cat {
        cat.meow()
    } else if let dog = pet as? Dog {
        dog.woof()
    }
}

(pets[0] as? Robot)?.name = "옵티머스"
