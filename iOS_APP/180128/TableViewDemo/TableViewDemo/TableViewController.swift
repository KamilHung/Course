//
//  TableViewController.swift
//  TableViewDemo
//
//  Created by cycu on 2018/1/28.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var cityList = [
        ["Taipei", "Zhongli", "Taizhong", "Tainan", "Khaosiung"],
        ["New York", "Los Angeles", "Chicago", "Seattle", "Houston"],
        ["London", "Munich", "Budapest", "Rome", "Moscow"]  ]
    
    var sectionNames = ["Taiwan", "US", "Europe"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cityList.count //Section number: 3 Array
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList[section].count //One section size
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)
        
        cell.textLabel?.text = cityList[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { //Show to Header
        return sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { //Edit Cell
        if editingStyle == .delete { //Delete Cell
            cityList[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


