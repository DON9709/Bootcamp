//
//  ViewController.swift
//  0612_2
//
//  Created by 이돈혁 on 6/12/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let uiview = UIView()
    let view2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(view2)
        view.addSubview(uiview)
        
        uiview.backgroundColor = .red
        view2.backgroundColor = .blue
        
        uiview.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(10)
            
        }
        view.addSubview(uiview)
        uiview.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}

