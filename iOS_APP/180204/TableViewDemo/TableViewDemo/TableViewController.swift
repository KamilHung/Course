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
        ["Taipei", "Zhongli", "Taizhung", "Tainan", "Kaoshiung"],       //0
        ["New York", "Los Angeles", "Chicago", "Seattle", "Houston"],   //1
        ["London", "Munich", "Budapest", "Rome", "Moscow"]              //2
    ]
    
    var sectionNames = ["Taiwan", "US", "Europe"]
    
    var imageList = ["taipei", "zhongli", "taizhung", "tainan", "kaoshiung"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cityList.count //Section number: 3 Array
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList[section].count //One section size
    }
    
    // section = 0
    //      row = 0 -> row = 1 -> ... -> row = 5
    // section = 1
    //      row = 0 -> row = 1 -> ... -> row = 5
    // ...
    // total 15 times
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Custom Cell", for: indexPath) as! MyTableViewCell //Change to MyTableViewCell
        
        //cell.textLabel?.text = cityList[indexPath.section][indexPath.row]
        cell.tableCellLabel.text = cityList[indexPath.section][indexPath.row] //Grab label values from data source
        
        let imageTitle = imageList[indexPath.row]
        cell.tableCellImageView.image = UIImage(named: imageTitle) //Grab Image from assets
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { //Show to Header
        return "I am a Header => " + sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? { //Show to footer
        return "I am a Footer End => " + sectionNames[section]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { //Edit Cell
        if editingStyle == .delete { //Delete Cell
            cityList[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}


