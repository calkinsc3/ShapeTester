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
            //self.progressLineLayer.strokeColor = self.progressLineColor.cgColor
        }
    }
    
    @IBInspectable var backgroudLineColor: UIColor = UIColor.gray {
        didSet {
           // self.backgroundLineLayer.strokeColor = self.backgroudLineColor.cgColor
        }
    }
    
    @IBInspectable var completedProgressColor: UIColor = UIColor.green {
        didSet {
           // self.completedCircleLayer.backgroundColor = self.completedProgressColor.cgColor
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
        self.completedCircleLayer.fillColor = self.completedProgressColor.cgColor
        self.completedCircleLayer.strokeColor = self.backgroudLineColor.cgColor
        self.completedCircleLayer.lineWidth = 10.0
        
        let archCenter = CGPoint(x: 10, y: self.bounds.height/2)
        let circlePath = UIBezierPath(arcCenter: archCenter, radius: CGFloat(15), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        self.completedCircleLayer.path = circlePath.cgPath
        self.layer.addSublayer(self.completedCircleLayer)
        
        let evaluateCircle = CAShapeLayer()
        evaluateCircle.frame = CGRect(origin: CGPoint(x: 20.0, y: 2.0), size: CGSize(width: 4.0, height: 4.0))
        evaluateCircle.fillColor = self.completedProgressColor.cgColor
        evaluateCircle.strokeColor = self.backgroudLineColor.cgColor
        evaluateCircle.lineWidth = 10.0
        evaluateCircle.path = circlePath.cgPath
        self.layer.addSublayer(evaluateCircle)
        
        
        
        
        //grey circle
//        let greyCircle = CAShapeLayer()
//        greyCircle.frame = CGRect(origin: CGPoint(x: 0.0, y:2.0), size: CGSize(width: 4.0, height: 4.0))
//        greyCircle.fillColor = UIColor.gray.cgColor
//        greyCircle.strokeColor = UIColor.gray.cgColor
//        greyCircle.lineWidth = 3.0
//
//        let greayArchCenter = CGPoint(x: 20, y: self.bounds.height/2)
//        let greycirclePath = UIBezierPath(arcCenter: greayArchCenter, radius: CGFloat(10), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
//        greyCircle.path = greycirclePath.cgPath
//        self.layer.addSublayer(greyCircle)
        
        
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
