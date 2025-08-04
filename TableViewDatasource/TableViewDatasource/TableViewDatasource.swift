//
//  TableViewDatasource.swift
//  TableViewDatasource
//
//  Created by 이돈혁 on 6/26/25.
//

import UIKit

class TableViewDatasource: NSObject, UITableViewDataSource {
    let array = ["1", "2", "3", "4", "5"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
}
