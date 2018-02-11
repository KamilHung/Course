//
//  TableViewController.swift
//  ListApp
//
//  Created by cycu on 2018/2/4.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayOfData = [String]()

    @IBAction func addNote(_ sender: UIBarButtonItem) {
        let addNoteAlert = UIAlertController(title: "New Name", message: "Add a name to the list", preferredStyle: .alert)
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (AlertAction) in
            let textField = addNoteAlert.textFields?.first
            self.arrayOfData.append(textField!.text!)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (AlertAction) in
        }
        
        
        addNoteAlert.addTextField { (TextField) in
            TextField.placeholder = "Name"
        }
        addNoteAlert.addAction(saveAction)
        addNoteAlert.addAction(cancelAction)
        
        present(addNoteAlert, animated: true, completion: nil)

    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)
        cell.textLabel!.text = arrayOfData[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayOfData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
    }
    
    
    
}
