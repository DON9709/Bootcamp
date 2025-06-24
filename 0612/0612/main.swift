//
//  main.swift
//  0612
//
//  Created by 이돈혁 on 6/12/25.
//

import Foundation

//1
var name: String? = "이돈혁"
    if let ifname = name {
        print("안녕하세요 \(ifname) 입니다.")
}

//2


//3
var age: Int? = 29
var height: Double? = 178

if let age = age, let height = height {
    print("나이: \(age), 키: \(height)cm")
}

//4
var numbers: [Int]? = [1, 2, 3]

if let numbersarr = numbers {
    if numbersarr.isEmpty {
        print("비어있음")
    } else {
        print("numbersarray: \(numbersarr)")
    }
}

//5
struct Dog {
    func bark() {
        print("왈왈")
    }
}

//6
var dog: Dog? = Dog()
dog?.bark()

//7
dog = nil
dog?.bark()

//8


//9
var value: Int? = 20

if let val = value, val > 15 {
    print("value is greater than 15")
}
