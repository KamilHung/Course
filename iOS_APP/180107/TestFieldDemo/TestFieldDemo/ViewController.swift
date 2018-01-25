//
//  ViewController.swift
//  TestFieldDemo
//
//  Created by cycu on 2018/1/7.
//  Copyright © 2018年 Kamil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() { //view use
        super.viewDidLoad()
        textField.delegate = self
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.text = "Please Enter something"
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label.text = textField.text
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing
    }
}
