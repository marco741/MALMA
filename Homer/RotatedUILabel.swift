//
//  RotatedUILabel.swift
//  Homer
//
//  Created by Alfredo Giuliano on 14/02/2020.
//  Copyright © 2020 Lorenzo Fasolino. All rights reserved.
//

import UIKit

@IBDesignable
class RotatedUILabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
        @IBInspectable var label_Rotation: Double = 0 {
            didSet {
                rotateLabel(labelRotation: label_Rotation)
                self.layoutIfNeeded()
            }
        }

        func rotateLabel(labelRotation: Double)  {
            self.transform = CGAffineTransform(rotationAngle: CGFloat((Double.pi / 4) ))
        }
    }
 
