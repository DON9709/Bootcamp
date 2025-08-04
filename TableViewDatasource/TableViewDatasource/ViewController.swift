//
//  ViewController.swift
//  TableViewDatasource
//
//  Created by 이돈혁 on 6/26/25.
//

import UIKit

class ViewController: UIViewController {
    let tableViewDataSource: TableViewDatasource()
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = tableViewDataSource
        // Do any additional setup after loading the view.
    }
}

