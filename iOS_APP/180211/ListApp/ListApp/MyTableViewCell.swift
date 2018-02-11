//
//  MyTableViewCell.swift
//  ListApp
//
//  Created by cycu on 2018/2/11.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    var backgroundIndex = 0
    @objc func changeBackgroundColor(){
        //self.backgroundColor = UIColor.black
        switch  backgroundIndex {
        case 0:
            self.backgroundColor = UIColor.gray
            backgroundIndex += 1
        case 1:
            self.backgroundColor = UIColor.red
            backgroundIndex += 1
        case 2:
            self.backgroundColor = UIColor.blue
            backgroundIndex += 1
        case 3:
            self.backgroundColor = UIColor.cyan
            backgroundIndex += 1
        case 4:
            self.backgroundColor = UIColor.green
            backgroundIndex += 1
        case 5:
            self.backgroundColor = UIColor.brown
            backgroundIndex += 1
        case 6:
            self.backgroundColor = UIColor.orange
            backgroundIndex += 1
        default:
            self.backgroundColor = UIColor.white
            backgroundIndex = 0
        }
    }

}
