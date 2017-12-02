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
        ClaimProgressResolve.drawClaimProgressBar(frame: rect, resizing: .aspectFit, isHidden: true)
    }
    
}
@IBDesignable
class ClaimProgressCloseView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        ClaimProgressClose.drawClaimProgressBar(frame: rect, resizing: .aspectFit, isHidden2: true)
    }
    
}
