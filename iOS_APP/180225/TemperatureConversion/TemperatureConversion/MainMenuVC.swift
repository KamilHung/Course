//
//  MainMenuVC.swift
//  TemperatureConversion
//
//  Created by David Chang on 13/01/2018.
//  Copyright © 2018 IOS Class. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {


    @IBOutlet weak var mainMenuIcon: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        mainMenuIcon.image = UIImage(named: "Swift Logo")
    }
    

}
