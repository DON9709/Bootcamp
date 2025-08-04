//
//  SavedBooksViewController.swift
//  BookFinder
//
//  Created by 이돈혁 on 7/31/25.
//


import UIKit
import CoreData

final class SavedBooksViewController: UIViewController {

    private var savedBooks: [BookEntity] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "저장한 책"

        setupTableView()
        fetchSavedBooks()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func fetchSavedBooks() {
        let context = CoreDataManager.shared.context
        let request: NSFetchRequest<BookEntity> = BookEntity.fetchRequest()

        do {
            savedBooks = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("저장된 책 불러오기 실패: \(error)")
        }
    }
}

extension SavedBooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let book = savedBooks[indexPath.row]
        cell.textLabel?.text = book.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Optional: Detail view 연결 예정 시 여기에 작성
    }
}
