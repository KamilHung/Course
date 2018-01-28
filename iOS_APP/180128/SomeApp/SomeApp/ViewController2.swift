//
//  ViewController2.swift
//  SomeApp
//
//  Created by cycu on 2018/1/28.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var myNameLabel: UILabel!
    var name = "test"
    
    override func viewDidLoad() {
        myNameLabel.text = name
    }
}
