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
        //ClaimProgress.drawClaimProgressBar()
        
        ClaimProgressBar.drawClaimProgressBar(frame: CGRect(origin: CGPoint(x:0.0, y:0.0), size: CGSize(width: self.bounds.width, height: 120.0)),
                                           resizing: .aspectFit,
                                           cgLayerToAnimate: self.layer,
                                           claimProgress: "SUBMISSION")
        
    }

}

enum ClaimProgress: String, Codable {
    
    case submission = "SUBMISSION", evaluation = "EVALUATION", resolution = "RESOLUTION", closed = "CLOSED", unknown
    
    init() {
        self = .unknown
    }
    
    init(withProgress: String?) {
        
        /* Values given by Arch doc
         SUBMISSION
         EVALUATION
         RESOLUTION
         CLOSE
         unknown - specific to app
         */
        
        guard let givenProgress = withProgress else {
            self = .unknown
            return
        }
        
        switch givenProgress.uppercased() {
        case "SUBMISSION": self = .submission
        case "EVALUATION": self = .evaluation
        case "RESOLUTION": self = .resolution
        case "CLOSED": self = .closed
        default:
            self = .unknown
        }
    }
}
