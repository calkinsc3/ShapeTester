//
//  ClaimProgressView.swift
//  ShapeTester
//
//  Created by William Calkins on 11/3/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//
//  This is for use in the claims app to show progress

import UIKit

@IBDesignable
class ClaimProgressView: UIView {

    let submission = UILabel()
    let evaluation = UILabel()
    let accepted = UILabel()
    let closed = UILabel()
    
    let backgroundLayer = CAShapeLayer()
    @IBInspectable var backGroundColor = UIColor.gray {
        didSet {
            self.configureView()
        }
    }
    
    let foregroundLayer = CAShapeLayer()
    @IBInspectable var foreGroundColor = UIColor.black {
        didSet {
            self.configureView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupShapeLayer(shapeLayer: self.foregroundLayer)
        self.setupShapeLayer(shapeLayer: self.backgroundLayer)
        
    }
    
    func setupView() {
        //setup background layer
        self.backgroundLayer.lineWidth = 20.0
        self.backgroundLayer.fillColor = nil
        self.backgroundLayer.strokeEnd = 1
        self.layer.addSublayer(self.backgroundLayer)
        
        //setup foreground layer
        self.foregroundLayer.lineWidth = 20.0
        self.foregroundLayer.fillColor = nil
        self.foregroundLayer.strokeEnd = 0.5
        self.layer.addSublayer(self.foregroundLayer)
        
        //set up first label
        self.submission.font = UIFont.systemFont(ofSize: 26.0)
        self.submission.textColor = UIColor.black
        self.submission.text = "Submission"
        self.submission.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.submission)
        
        //setup constraints
        let submissionLabelCenterX = self.submission.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let submissionLabelCenterY = self.submission.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([submissionLabelCenterX, submissionLabelCenterY])
        
    }
    
    func configureView() {
        self.backgroundLayer.strokeColor = self.backGroundColor.cgColor
        self.foregroundLayer.strokeColor = self.foreGroundColor.cgColor
        
    }
    
    private func setupShapeLayer(shapeLayer: CAShapeLayer) {
        shapeLayer.frame = self.bounds
        let path = UIBezierPath(arcCenter: self.submission.center, radius: 90.0, startAngle: 45, endAngle: 35, clockwise: true)
        shapeLayer.path = path.cgPath
    }

}
