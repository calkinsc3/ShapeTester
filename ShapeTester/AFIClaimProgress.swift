//
//  AFIClaimProgress.swift
//  ShapeTester
//
//  Created by Calkins, Bill on 11/3/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

@IBDesignable
class AFIClaimProgress: UIView {
    
    @IBInspectable var progressLineColor: UIColor = UIColor.blue {
        didSet {
            //call config function
        }
    }
    
    @IBInspectable var backgroudLineColor: UIColor = UIColor.gray {
        didSet {
            //call config function
        }
    }
    
    @IBInspectable var completedProgressColor: UIColor = UIColor.green {
        didSet {
            //call config function
        }
    }
    
    let progressLineLayer = CAShapeLayer()
    let backgroundLineLayer = CAShapeLayer()
    let completeCircleLayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    fileprivate func setupProgressView() {
        
    }
    
    fileprivate func configureProgressView() {
        
    }
    
    
    
    
    

}
