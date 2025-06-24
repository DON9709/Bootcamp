//
//  main.swift
//  0611
//
//  Created by 이돈혁 on 6/11/25.
//

import Foundation

//1
let gagaga = String(repeating: "가", count: 10)
print(gagaga)

//2
let count = "abcde" .count
print(count)

//3
let string1 = "abcdefg"
print(string1.contains("cde"))

//4
let numString = "123,456,789"
let split1 = numString.split(separator: ",")
print(split1)

//5
let string2 = "abcde"
let array1: [Character] = Array(string2)
print(array1[2])

//6
print("a" < "b")

//7
let name = "이돈혁"
print("안녕하세요 \(name)입니다.")

//8
let sentence = "안녕하세요 내일배움캠프 진행 중입니다."
let words = sentence.split(separator: " ")
print(words)

//9
let reSentence = words.joined(separator: " ")
print(reSentence)

//10
let wrong = "abcbcbcd"
let right = wrong.replacingOccurrences(of: "bc", with: "ef")
print(right)
