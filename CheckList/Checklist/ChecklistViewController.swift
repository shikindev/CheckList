//
//  ViewController.swift
//  CheckList
//
//  Created by maxshikin on 28.12.2022.
//

import UIKit

class ChecklistViewController: UITableViewController {

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    return cell
    }
}

