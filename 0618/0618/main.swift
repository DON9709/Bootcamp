//
//  main.swift
//  0618
//
//  Created by 이돈혁 on 6/18/25.
//

import Foundation

//1
func checkTemp(_ temp: Int) -> Bool {
    if temp >= 25 {
        print("덥다")
        return true
    } else {
        print("춥다")
        return false
    }
}

//2
func isEven(_ number: Int) -> Bool {
    return number % 2 == 0
}

//3
func isAdult(_ age: Int) -> Bool {
    return age >= 19
}

//4
func bigger(_ a: Double, _ b: Double) -> Bool {
    return a > b
}

//5
func access(_ isLoggedIn: Bool, _ isAdmin: Bool ) -> Bool {
    return isLoggedIn && isAdmin
}

//6
func isNotEmpty(_ text: String?) -> Bool {
    return !text.isEmpty
}

//7
func handleResult(_ success: Bool) -> Bool {
    if success {
        print("성공")
    } else {
        print("실패")
        return false
    }
}

