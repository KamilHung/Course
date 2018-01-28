//
//  ViewController.swift
//  SomeApp
//
//  Created by cycu on 2018/1/28.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameInputTxt: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController2 {
            vc.name = userNameInputTxt.text!
        }
    }
}

