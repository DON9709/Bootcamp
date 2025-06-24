//
//  main.swift
//  0623
//
//  Created by 이돈혁 on 6/23/25.
//

import Foundation

//1
enum LoginError: Error {
    case invalidCredentials
    case userNotFound
}

func login(username: String, password: String) throws {
    if username != "admin" {
        throw LoginError.userNotFound
    } else if password != "1234" {
        throw LoginError.invalidCredentials
    }
}

//2
enum ATMError: Error {
    case insufficientFunds
}

class ATM {
    var balance: Double
    
    init(balance: Double) {
        self.balance = balance
    }
    
    func withdraw(amount: Double) throws {
        if amount > balance {
            throw ATMError.insufficientFunds
        }
        balance -= amount
    }
}
