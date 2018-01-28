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
    @IBOutlet weak var userAgeInputTxt: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Single segue
        /*if let vc = segue.destination as? ViewController2 {
            vc.name = userNameInputTxt.text!
        }*/
        
        //Multi segue PPT page7
        if let identifer = segue.identifier {
            switch identifer {
                case "My Segue": //Segue identifier
                    if let vc = segue.destination as? ViewController2{
                        vc.name = userNameInputTxt.text!
                }
                case "My Segue2":
                    if let vc = segue.destination as? ViewController3{
                        vc.age = userAgeInputTxt.text!
                        vc.name2 = userNameInputTxt.text!
                }
                default: break;
            }
        }
    }
}

