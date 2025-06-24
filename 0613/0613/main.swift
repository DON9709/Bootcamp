//
//  main.swift
//  0613
//
//  Created by 이돈혁 on 6/13/25.
//

import Foundation

//1
let numbers = Array(1...10)
for number in numbers {
    print(number)
}

//2
for num in 11...20 {
    print(num)
}

//3
var allnum: [Int] = []
for num in 21...30 {
    allnum.append(num)
}
print(allnum)

//4
let arr = ["one", "two", "three", "four"]
for (index, value) in arr.enumerated() {
    print("\(index+1): \(value)")
}

//5
var i = 31
while i <= 100 {
    print(i)
    i += 1
}

//6
let word = "아"

//7

