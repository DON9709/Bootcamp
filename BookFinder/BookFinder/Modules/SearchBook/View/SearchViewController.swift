
//
//  SearchViewController.swift
//  BookFinder
//
//  Created by 이돈혁 on 7/31/25.
//

import UIKit

class SearchViewController: UIViewController {

    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "책 제목을 입력하세요"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("검색", for: .normal)
        return button
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookCell")
        return tableView
    }()

    private let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "책 검색"
        view.backgroundColor = .white

        setupUI()
        setupActions()
        setupTableView()
    }

    private func setupUI() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)

        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -8),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),

            searchButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchButton.widthAnchor.constraint(equalToConstant: 60),

            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupActions() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    @objc private func searchButtonTapped() {
        guard let keyword = searchTextField.text, !keyword.isEmpty else { return }
        viewModel.searchBooks(keyword: keyword) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBooks()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = viewModel.book(at: indexPath.row)
        cell.textLabel?.text = book.title
        return cell
    }
}



extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let book = viewModel.book(at: indexPath.row)
        let detailVC = BookDetailViewController(book: book)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
