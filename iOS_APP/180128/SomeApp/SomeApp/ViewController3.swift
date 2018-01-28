//
//  ViewController3.swift
//  SomeApp
//
//  Created by cycu on 2018/1/28.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var myAgeLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    
    var age = "18"
    var name2 = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myAgeLabel.text = age
        myNameLabel.text = name2
    }

}
