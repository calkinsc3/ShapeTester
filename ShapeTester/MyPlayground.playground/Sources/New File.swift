import Foundation

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
    
    let progressLineLayer = CAShapeLayer()
    let backgroundLineLayer = CAShapeLayer()
    let completedCircleLayer = CAShapeLayer()
    
    @IBInspectable var progressLineColor: UIColor = UIColor.blue {
        didSet {
            self.progressLineLayer.strokeColor = self.progressLineColor.cgColor
        }
    }
    
    @IBInspectable var backgroudLineColor: UIColor = UIColor.gray {
        didSet {
            self.backgroundLineLayer.strokeColor = self.backgroudLineColor.cgColor
        }
    }
    
    @IBInspectable var completedProgressColor: UIColor = UIColor.green {
        didSet {
            self.completedCircleLayer.backgroundColor = self.completedProgressColor.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupProgressView()
    }
    
    fileprivate func setupProgressView() {
        
        //background line
        self.backgroundLineLayer.frame = self.bounds
        self.backgroundLineLayer.fillColor = self.backgroudLineColor.cgColor
        let backgrounLinePath = UIBezierPath(rect: CGRect(x: 0.0, y: self.bounds.height/2, width: self.bounds.width, height: 20.0))
        self.backgroundLineLayer.path = backgrounLinePath.cgPath
        self.layer.addSublayer(self.backgroundLineLayer)
        
        //progress line
        self.progressLineLayer.frame = self.bounds
        self.progressLineLayer.fillColor = self.progressLineColor.cgColor
        self.progressLineLayer.strokeStart = 0.0
        self.progressLineLayer.strokeEnd = 0.5
        let linePath = UIBezierPath(rect: CGRect(x: 0.0, y: self.backgroundLineLayer.bounds.height/2, width: self.bounds.width/2, height: 10.0))
        self.progressLineLayer.path = linePath.cgPath
        self.layer.addSublayer(self.progressLineLayer)
        
        //completed circles
        self.completedCircleLayer.frame = CGRect(origin: CGPoint(x: 0.0, y:2.0), size: CGSize(width: 4.0, height: 4.0))
        self.completedCircleLayer.fillColor = nil
        self.completedCircleLayer.strokeColor = self.completedProgressColor.cgColor
        self.completedCircleLayer.strokeEnd = 1.0
        
        let startAngle = DegreesToRadians(value: 270.0)
        let endAngle = DegreesToRadians(value: 270.0)
        let radius = self.bounds.width * 0.35
        let archCenter = self.center
        let circlePath = UIBezierPath(arcCenter: archCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        self.completedCircleLayer.path = circlePath.cgPath
        self.layer.addSublayer(self.completedCircleLayer)
        
    }
    
    fileprivate func configureProgressView() {
        
    }
    
}


let π = CGFloat(Double.pi)

func DegreesToRadians (value:CGFloat) -> CGFloat {
    return value * π / 180.0
}

func RadiansToDegrees (value:CGFloat) -> CGFloat {
    return value * 180.0 / π
}
