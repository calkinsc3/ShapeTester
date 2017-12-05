//
//  ClaimProgressView.swift
//  ShapeTester
//
//  Created by William Calkins on 12/2/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

@IBDesignable
class ClaimProgressEvaluateView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        ClaimProgressEvaluate.drawClaimProgressBar(frame: rect, resizing: .aspectFit, isHidden: true, cgViewToAnimate: self.layer)
    }
    
}

@IBDesignable
class ClaimProgressResolveView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        ClaimProgressResolve.drawClaimProgressBar(frame: rect, resizing: .aspectFit, cgViewToAnimate: self.layer)
    }
    
}
@IBDesignable
class ClaimProgressCloseView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        ClaimProgressClose.drawClaimProgressBar(frame: rect, resizing: .aspectFit, cgViewToAnimate: self.layer)
    }
    
}

@IBDesignable
class ClaimCircleView: UIView {
    override func draw(_ rect: CGRect) {
        //Draw circle
        CircleTransformTest.drawCircleTransform(frame: rect, resizing: .aspectFit)
    }
}
