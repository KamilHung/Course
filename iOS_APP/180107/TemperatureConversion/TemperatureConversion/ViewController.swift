//
//  ViewController.swift
//  TemperatureConversion
//
//  Created by cycu on 2018/1/7.
//  Copyright © 2018年 Kamil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTemperature: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var onOffButton: UISwitch!
    
    @IBOutlet weak var lockLabel: UILabel!
    
    @IBAction func changeLockLabelText(_sender:UISwitch){
        if onOffButton.isOn{
            lockLabel.text = "Unlocked"
            lockLabel.textColor = UIColor.blue
        }else{
            lockLabel.text = "Locked"
            lockLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func convertF(_ sender: UIButton) {
        if onOffButton.isOn == true{
            if let tempF = Double(userTemperature.text!){
                let tempC = (tempF - 32) * 5 / 9
                answer.text = "\(tempC)"
            }else{
                answer.text = "Numbers only"
            }
        }else{
            answer.text = "Unlock first"
        }
    }
}
