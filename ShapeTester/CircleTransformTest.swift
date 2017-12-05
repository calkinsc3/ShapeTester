//
//  CircleTransformTest.swift
//  CircleTester
//
//  Created by Bill Calkins on 12/5/17.
//  Copyright © 2017 (null). All rights reserved.
//



import UIKit

public class CircleTransformTest : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawCircleTransform(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 80), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 200, height: 80), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 200, y: resizedFrame.height / 80)


        //// Color Declarations
        let blueCompleteColor = UIColor(red: 0.098, green: 0.369, blue: 0.690, alpha: 1.000)

        //// greyCircle Drawing
        let greyCirclePath = UIBezierPath(ovalIn: CGRect(x: 86, y: 26, width: 32, height: 32))
        UIColor.lightGray.setFill()
        greyCirclePath.fill()


        //// blueCircle Drawing
        context.saveGState()
        context.translateBy(x: 102, y: 42)
        context.scaleBy(x: 1.2, y: 1.2)

        let blueCirclePath = UIBezierPath(ovalIn: CGRect(x: -10, y: -10, width: 20, height: 20))
        blueCompleteColor.setFill()
        blueCirclePath.fill()

        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(CircleTransformTestResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
