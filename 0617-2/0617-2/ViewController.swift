//
//  ViewController.swift
//  0617-2
//
//  Created by 이돈혁 on 6/17/25.
//

import UIKit


class VIEwController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapShow(_ sender: Any) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")

         self.navigationController?.pushViewController(pushVC!, animated: true)
    }
}
