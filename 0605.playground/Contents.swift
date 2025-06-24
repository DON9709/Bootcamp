//
//  0605
//
//  Created by 이돈혁 on 6/5/25.
//

func  checkNumber(_ n: Int) {
    if n < 0 {
        print("음수입니다.")
        return
    }
    print("양수입니다.")
}
checkNumber(10)

func categorize(_ m: Int) {
    if m >= 10 {
        print ("1")
    } else if m >= 5 {
        print("2")
    } else {
        print("3")
    }
}
categorize(7)

for i in 0...10 {
    print(i)
}


for j in 0...20 {
    if j % 2 == 0 {
        print(j)
    }
}


let nums = [1, 2, 3, 4, 5]
let alphabets = ["a", "b", "c", "d", "e"]

for n in nums {
    for a in alphabets {
        print("\(n)\(a)")
    }
}


let arr = Array(1...10)
let evenArr = arr.filter { $0 % 2 == 0 }
print(evenArr)


var i = 0
repeat {
    print("repeat: \(i)")
    i += 1
} while i < 5
            
var j = 0
while j < 5 {
    print("while: \(j)")
    j += 1
}


var n = 1
while n <= 100 {
    print(n)
    n += 1
}


for i in 2...9 {
    for j in 1...9 {
        print("\(i) * \(j) = \(i * j)")
    }
}
