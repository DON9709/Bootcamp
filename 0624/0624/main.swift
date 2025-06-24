//
//  main.swift
//  0624
//
//  Created by 이돈혁 on 6/24/25.
//

import Foundation

//1
struct Student {
    var midtermScore: Int?
}
let student = Student(midtermScore: 80)

if let score = student.midtermScore {
    print(score)
} else {
    print("no score")
}

//2
class Book {
    var title: String?
}

let book = Book()
book.title = "IFRS 실무회계"

if let title = book.title {
    print(title.count)
} else {
    print("no title")
}

//3
struct User {
    var email: String?
}

let user = User(email: "Greenwood@gmail.com")

if let email = user.email, let atIndex = email.firstIndex(of: "@") {
    let domain = email[email.index(after: atIndex)...]
    print(domain)
} else {
    print("이메일 없음")
}

//4
struct Department {
    var managerName: String?
}

struct Company {
    var department: Department?
}

let company = Company(department: Department(managerName: "Amorim"))

if let manager = company.department?.managerName {
    print(manager)
} else {
    print("책임자 없음")
}

//5
