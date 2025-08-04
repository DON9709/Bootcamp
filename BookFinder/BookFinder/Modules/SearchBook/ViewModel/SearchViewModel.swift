//
//  SearchViewModel.swift
//  BookFinder
//
//  Created by 이돈혁 on 7/31/25.
//

import Foundation

final class SearchViewModel {
    
    private(set) var books: [Book] = []
    
    func searchBooks(keyword: String, completion: @escaping () -> Void) {
        APIManager.shared.searchBooks(query: keyword) { [weak self] books in
            self?.books = books
            completion()
        }
    }
    
    func numberOfBooks() -> Int {
        return books.count
    }
    
    func book(at index: Int) -> Book {
        return books[index]
    }
}
