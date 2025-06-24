//
//  main.swift
//  0619
//
//  Created by 이돈혁 on 6/19/25.
//

import Foundation

print("test")

//1
let nums = [1, 2, 3, 4]
let stringNums = nums.map { String($0) }
print(stringNums)

//2
let words = ["apple", "banana", "kiwi", "pear"]
let shortWords = words.filter { $0.count <= 5 }

//3
let joinWords = words.joined()

//4
var numbers = [5, 4, 3, 2, 1]
let sortedNumbers = numbers.sorted()
print(sortedNumbers)

//5
let names = ["James", "John", "Robert", "Michael", "William"]
for name in names {
    print("안녕하세요, \(name)")
}

//6

//7
if let firstOdd = nums.first(where: { $0 % 2 != 0 }) {
    print(firstOdd)
}

