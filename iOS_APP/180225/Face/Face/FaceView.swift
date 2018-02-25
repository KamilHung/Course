//
//  FaceView.swift
//  Face
//
//  Created by cycu on 2018/2/25.
//  Copyright © 2018年 cycu. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let skullRadius = min(bounds.size.width, bounds.size.height) / 2
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        
        skull.lineWidth = 5.0
        UIColor.gray.set()
        skull.stroke()
    }

}
