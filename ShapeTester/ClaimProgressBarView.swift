//
//  ClaimProgressBarView.swift
//  ShapeTester
//
//  Created by William Calkins on 12/1/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class ClaimProgressBarView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        ClaimProgress.drawClaimProgressBar()
    }
    

}
