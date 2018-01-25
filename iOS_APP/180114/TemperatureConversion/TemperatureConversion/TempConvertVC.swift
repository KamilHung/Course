//
//  ViewController.swift
//  TemperatureConversion
//
//  Created by David Chang on 15/01/2017.
//  Copyright © 2017 IOS Class. All rights reserved.
//

import UIKit

class TempConvertVC: UIViewController, UITextFieldDelegate {
    

    
    
    @IBOutlet weak var userTemperature: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var onOffButton: UISwitch!
    @IBOutlet weak var lockLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTemperature.delegate = self

    }

    
    
    @IBAction func changeLockLabelText(_ sender: UISwitch) {
        if onOffButton.isOn {
            lockLabel.text = "Unlocked"
            lockLabel.textColor = UIColor.blue
        } else {
            lockLabel.text = "Locked"
            lockLabel.textColor = UIColor.red
        }
    }
    
    
    @IBAction func convertF(_ sender: UIButton) {
        if onOffButton.isOn == true {
            if let tempF = Double(userTemperature.text!) {
                let tempC = (tempF - 32) * 5 / 9
                answer.text = "\(tempC)"
            } else {
                answer.text = "Numbers Only!"
            }
        } else {
            answer.text = "Unlock First!"
        }
        
        userTemperature.resignFirstResponder()
        
        
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        userTemperature.text = ""
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if onOffButton.isOn == true {
            if let tempF = Double(userTemperature.text!) {
                let tempC = (tempF - 32) * 5 / 9
                answer.text = "\(tempC)"
            } else {
                answer.text = "Numbers Only!"
            }
        } else {
            answer.text = "Unlock First!"
        }
        
        userTemperature.resignFirstResponder()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    

    
    
    
    
    
    

    
    
}

