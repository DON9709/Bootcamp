//
//  BookDetialViewController.swift
//  BookFinder
//
//  Created by 이돈혁 on 7/31/25.
//


import UIKit

final class BookDetailViewController: UIViewController {

    private let book: Book

    init(book: Book) {
        self.book = book
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let publisherLabel = UILabel()
    private let priceLabel = UILabel()
    private let contentsLabel = UILabel()
    private let saveButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configure()
    }

    private func setupUI() {
        [imageView, titleLabel, authorLabel, publisherLabel, priceLabel, contentsLabel, saveButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        titleLabel.font = .boldSystemFont(ofSize: 20)
        authorLabel.font = .systemFont(ofSize: 16)
        publisherLabel.font = .systemFont(ofSize: 14)
        priceLabel.font = .systemFont(ofSize: 14)
        contentsLabel.font = .systemFont(ofSize: 14)
        contentsLabel.numberOfLines = 5

        saveButton.setTitle("담기", for: .normal)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 140),

            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            publisherLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            publisherLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            publisherLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            priceLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            contentsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            contentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            saveButton.topAnchor.constraint(equalTo: contentsLabel.bottomAnchor, constant: 24),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func configure() {
        titleLabel.text = book.title
        authorLabel.text = "저자: \(book.authors.joined(separator: ", "))"
        publisherLabel.text = "출판사: \(book.publisher)"
        priceLabel.text = "가격: \(book.price)원"
        contentsLabel.text = book.contents

        if let url = URL(string: book.thumbnail) {
            // 단순 이미지 로딩 (이미지 캐시 라이브러리 없으므로 URLSession 사용 가능)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}
