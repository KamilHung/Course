//
//  TableViewController.swift
//  TableViewDemo
//
//  Created by cycu on 2018/1/28.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var cityList = ["Taipei", "Zhongli", "Taizhong", "Tainan", "Khaosiung"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //Section number
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count //Array size
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)
        
        cell.textLabel?.text = cityList[indexPath.row]
        return cell
    }
}


