//
//  main.swift
//  0610
//
//  Created by 이돈혁 on 6/10/25.
//

import Foundation

print("Hello, World!")

//1
let arr = [1, 2, 3, 4, 5]
print(arr.contains(3))

//2
let arr1 = Array(1...100)

//3
for num in arr1 {
    print(num)
}

//4
let multiple3 = arr.filter {
    $0 % 3 == 0
}
print(multiple3)

//5
var people = [
    "홍길동": "970901-1000000",
    "황희찬": "980101-1000000",
    "이시아": "930101-2000000"
]

//6
for name in people.keys {
    print(name)
}

//7
let Set1: Set = [1, 2, 3, 4, 5]

//8
let array = ["가", "나", "다", "라", "마", "가"]
let overkill = Set(array)
print(overkill)

//9
let numbers = [1, 2, 3]
let numSet = Set(numbers)
if numbers.count == numSet.count {
    print("중복 없음")
} else {
    print("중복")
}

//10
var arr2 = [1, 2, 3, 4, 5]
arr2.append(6)
print(arr2)

