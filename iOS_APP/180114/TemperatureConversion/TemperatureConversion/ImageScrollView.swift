//
//  ImageScrollView.swift
//  TemperatureConversion
//
//  Created by cycu on 2018/1/14.
//  Copyright © 2018年 IOS Class. All rights reserved.
//

import UIKit

class ImageScrollView: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var orginalPic: UIButton!
    @IBOutlet weak var pic2: UIButton!
    @IBOutlet weak var pic3: UIButton!
    @IBOutlet weak var pic4: UIButton!
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreateImage()
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.frame.size
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.10
        scrollView.maximumZoomScale = 2.0
        // Do any additional setup after loading the view.
    }
    
    func CreateImage(){
        imageView.image = UIImage(named: "wallup19915")
        imageView.sizeToFit()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @IBAction func originalPicF(_ sender: UIButton) {
        imageView.image = UIImage(named: "wallup19915")
        //imageView.sizeToFit()
        
    }
    
    @IBAction func pic2F(_ sender: UIButton) {
        imageView.image = UIImage(named: "cute2")
        //imageView.sizeToFit()
    }
    
    @IBAction func pic3F(_ sender: UIButton) {
        imageView.image = UIImage(named: "cute3")
        //imageView.sizeToFit()
    }
    
    @IBAction func pic4F(_ sender: UIButton) {
        imageView.image = UIImage(named: "cute4")
        //imageView.sizeToFit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }}
