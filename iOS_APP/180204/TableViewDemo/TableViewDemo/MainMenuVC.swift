//
//  MainMenuVC.swift
//  TableViewDemo
//
//  Created by cycu on 2018/2/4.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {

    @IBOutlet weak var labelToBeChanged: UILabel!
    
    
    @IBAction func changeLabel(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Hello",
            message: "How are you?",
            preferredStyle: .alert
        )
        
        let actionHappy = UIAlertAction(
            title: "I am Happy",
            style: .default
        ){
            (AlertAction) in self.labelToBeChanged.text = "I am happy"
        }
        
        let actionSad = UIAlertAction(
            title: "I am sad :(",
            style: .default
        ){
            (AlertAction) in self.labelToBeChanged.text = AlertAction.title
        }
        
        alert.addAction(actionHappy)
        alert.addAction(actionSad)
        
        present(alert, animated: true, completion: nil)
    }
}
