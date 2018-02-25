//
//  ImageScrollVC.swift
//  TemperatureConversion
//
//  Created by David Chang on 13/01/2018.
//  Copyright © 2018 IOS Class. All rights reserved.
//

import UIKit

class ImageScrollVC: UIViewController, UIScrollViewDelegate {
    
    let NASA = [
        "Swift" : "https://ih0.redbubble.net/image.176266446.3626/flat,800x800,075,f.jpg",
        "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    
    var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var spinner: UIActivityIndicatorView! //Add Activity Indicator View
    
    @IBAction func changeImage(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle { //catch button title name
            if let urlString = NASA[buttonTitle]{
                createImage(urlString: urlString)
            }
        }
    }
    
    var mostRecentURLString = "someString" //save URL value: ....jpg

    func createImage(urlString: String) {
        mostRecentURLString = urlString //first image
        
        spinner.startAnimating() //Activity Indicator View Start
        
        if let imageURL = URL(string: urlString){
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async{ //Set to other queue
                if let imageData = try? Data(contentsOf: imageURL){ //Data() is throws, add "try?"
                    //imageView.image = UIImage(named: imageNamed)
                    DispatchQueue.main.async { //other queue push to main queue
                        if urlString == self.mostRecentURLString{ //now URL String == touch image name?
                            self.imageView.image = UIImage(data: imageData) //add self.
                            self.imageView.sizeToFit()
                            self.scrollView.zoomScale = 1
                            self.scrollView.contentSize = self.imageView.frame.size
                            self.spinner.stopAnimating() //Activity Indicator View Stop
                        }else{
                            print("\(urlString) is ignored")
                        }
                    }
                }
            }
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //createImage(imageNamed: "Pic 1")
        createImage(urlString: NASA["Swift"]!)
        
        scrollView.addSubview(imageView)
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.03
        scrollView.maximumZoomScale = 1.0
    }
}
