//
//  Book.swift
//  BookFinder
//
//  Created by 이돈혁 on 7/31/25.
//



import Foundation

struct Book: Decodable {
    let title: String
    let authors: [String]
    let publisher: String
    let price: Int
    let thumbnail: String
    let contents: String
}
