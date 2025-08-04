//
//  ViewController.swift
//  0702_2
//
//  Created by 이돈혁 on 7/2/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set("DON", forKey: "number")

        let number = UserDefaults.standard.string(forKey: "number")
        label.text = number
    }
}
