//1
print(!true == false)

//2
for i in 1...50 {
    if i % 2 == 0 || i % 3 != 0 {
        print(i)
    }
}

//3
for i in 1...100 {
    if i % 10 == 0 || i % 12 == 0 {
        print(i)
    }
}

//4
let letters = ["a", "b", "c", "d", "e"]
for i in 1...5 {
    for letter in letters {
        print("\(i)\(letter)")
    }
}

//5
for i in 1...5 {
    for letter in letters {
        if letter == "a" || letter == "c" || letter == "e" {
            print("\(i)\(letter)")
        }
    }
}

//6
let result = false || false || true || false
print(result)

//7
if 1 > 10 && 2 > 1 {
    print(true)
} else {
    print(false)
}

//8
if 10 > 5 && 20 > 10 && 30 <= 20 {
    print(true)
} else {
    print(false)
}

//9
let x = 15
let answer = x > 20 ? "20보다 큽니다" :
x < 10 ? "10보다 작습니다" :
"10에서 20 사이입니다"
print(answer)
