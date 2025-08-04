//
//  APIManager.swift
//  BookFinder
//
//  Created by 이돈혁 on 7/31/25.
//

import Foundation

struct BookResponse: Decodable {
    let documents: [Book]
}

final class APIManager {
    static let shared = APIManager()
    private init() {}

    private let apiKey = "KakaoAK 89ceb73c3bd2e3db5b45dfd1ffeb9131"

    func searchBooks(query: String, completion: @escaping ([Book]) -> Void) {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://dapi.kakao.com/v3/search/book?query=\(encodedQuery)"
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(BookResponse.self, from: data)
                completion(decoded.documents)
            } catch {
                print("JSON 디코딩 실패: \(error)")
                completion([])
            }
        }.resume()
    }
}
