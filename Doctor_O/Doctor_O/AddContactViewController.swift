//
//  AddContactViewController.swift
//  Doctor_O
//
//  Created by 이돈혁 on 7/14/25.
//

import UIKit

struct Friend: Codable {
    let name: String
    let phone: String
    let imageData: Data?
}

enum ContactStorage {
    static let key = "friends_storage"

    static func save(_ friends: [Friend]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(friends) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    static func load() -> [Friend] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let friends = try? JSONDecoder().decode([Friend].self, from: data) else {
            return []
        }
        return friends
    }
}

class AddContactViewController: UIViewController {

    var onSave: ((Friend) -> Void)?

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.circle")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let nameField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "이름을 입력하세요"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let phoneField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "전화번호를 입력하세요"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .phonePad
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    private let randomImageButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("랜덤 이미지 생성", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "연락처 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "적용", style: .done, target: self, action: #selector(didTapSave))
        setupLayout()
        randomImageButton.addTarget(self, action: #selector(generateRandomImage), for: .touchUpInside)
    }

    private func setupLayout() {
        view.addSubview(imageView)
        view.addSubview(randomImageButton)
        view.addSubview(nameField)
        view.addSubview(phoneField)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            randomImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            randomImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.topAnchor.constraint(equalTo: randomImageButton.bottomAnchor, constant: 18),
            nameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            phoneField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            phoneField.leftAnchor.constraint(equalTo: nameField.leftAnchor),
            phoneField.rightAnchor.constraint(equalTo: nameField.rightAnchor),
        ])
    }

    @objc private func didTapSave() {
        let newFriend = Friend(
            name: nameField.text ?? "",
            phone: phoneField.text ?? "",
            imageData: imageView.image?.jpegData(compressionQuality: 0.8)
        )

        var current = ContactStorage.load()
        current.append(newFriend)
        ContactStorage.save(current)

        navigationController?.popViewController(animated: true)
    }

    @objc private func generateRandomImage() {
        let id = Int.random(in: 1...1000)
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(id)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let sprites = json["sprites"] as? [String: Any],
               let imageUrlString = sprites["front_default"] as? String,
               let imageUrl = URL(string: imageUrlString) {

                URLSession.shared.dataTask(with: imageUrl) { imageData, _, _ in
                    if let imageData = imageData, let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }.resume()
            }
        }.resume()
    }
}
