//
//  ClaimProgressClose.swift
//  Claims
//
//  Created by Bill Calkins on 12/2/17.
//  Copyright © 2017 (null). All rights reserved.
//



import UIKit

public class ClaimProgressClose : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawClaimProgressBar(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 100),
                                                         resizing: ResizingBehavior = .aspectFit,
                                                         cgViewToAnimate: CALayer) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 400, height: 100), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 400, y: resizedFrame.height / 100)


        //// Color Declarations
        let blueCompleteColor = UIColor(red: 0.098, green: 0.369, blue: 0.690, alpha: 1.000)
        let checkMarkColor = UIColor(red: 0.455, green: 0.620, blue: 0.000, alpha: 1.000)
        let checkMarkWhite = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let blueProgressColor = UIColor(red: 0.098, green: 0.369, blue: 0.655, alpha: 1.000)
        let greyProgressBarColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.000)
        let darkGreyText = UIColor(red: 0.322, green: 0.322, blue: 0.322, alpha: 1.000)

        //// greyOuterProgressBar Drawing
        let greyOuterProgressBarPath = UIBezierPath()
        greyOuterProgressBarPath.move(to: CGPoint(x: 41, y: 62))
        greyOuterProgressBarPath.addLine(to: CGPoint(x: 373, y: 62))
        greyOuterProgressBarPath.addLine(to: CGPoint(x: 373, y: 48))
        greyOuterProgressBarPath.addLine(to: CGPoint(x: 41, y: 48))
        greyOuterProgressBarPath.addLine(to: CGPoint(x: 41, y: 62))
        greyOuterProgressBarPath.close()
        greyProgressBarColor.setFill()
        greyOuterProgressBarPath.fill()


        //// submitGreyCircle Drawing
        let submitGreyCirclePath = UIBezierPath(ovalIn: CGRect(x: 29, y: 39, width: 32, height: 32))
        greyProgressBarColor.setFill()
        submitGreyCirclePath.fill()


        //// evaluateGreyCircle Drawing
        let evaluateGreyCirclePath = UIBezierPath(ovalIn: CGRect(x: 125, y: 39, width: 32, height: 32))
        greyProgressBarColor.setFill()
        evaluateGreyCirclePath.fill()


        //// resolveGreyCircle Drawing
        let resolveGreyCirclePath = UIBezierPath(ovalIn: CGRect(x: 234, y: 39, width: 32, height: 32))
        greyProgressBarColor.setFill()
        resolveGreyCirclePath.fill()


        //// greyCircleClose Drawing
        let greyCircleClosePath = UIBezierPath(ovalIn: CGRect(x: 348, y: 39, width: 32, height: 32))
        greyProgressBarColor.setFill()
        greyCircleClosePath.fill()


        //// blueProgressBar Drawing
        let blueProgressBarPath = UIBezierPath()
        blueProgressBarPath.move(to: CGPoint(x: 47, y: 70))
        blueProgressBarPath.addLine(to: CGPoint(x: 335, y: 70))
//        blueProgressBarPath.addLine(to: CGPoint(x: 358, y: 53))
//        blueProgressBarPath.addLine(to: CGPoint(x: 41, y: 53))
//        blueProgressBarPath.addLine(to: CGPoint(x: 41, y: 57))
//        blueProgressBarPath.close()
//        blueProgressColor.setFill()
//        blueProgressBarPath.fill()
//        blueCompleteColor.setStroke()
//        blueProgressBarPath.lineWidth = 0
//        blueProgressBarPath.lineCapStyle = .round
//        blueProgressBarPath.stroke()
        
        //animate progress bar
        //create shape for path
        let lineCloseShape = CAShapeLayer()
        lineCloseShape.fillColor = blueProgressColor.cgColor
        lineCloseShape.fillRule = kCAFillRuleEvenOdd
        lineCloseShape.strokeColor = blueProgressColor.cgColor
        lineCloseShape.lineWidth = 4
        lineCloseShape.path = blueProgressBarPath.cgPath
        
        //animate the line with stroke end
        let lineCloseAnimation = CABasicAnimation(keyPath: "strokeEnd")
        lineCloseAnimation.fromValue = 0
        lineCloseAnimation.duration = 2
        lineCloseAnimation.repeatCount = 4
        lineCloseShape.add(lineCloseAnimation, forKey: "strokeEnd")
        cgViewToAnimate.addSublayer(lineCloseShape)


        //// submitText Drawing
        let submitTextRect = CGRect(x: 14, y: 18, width: 63, height: 14)
        let submitTextTextContent = "SUBMIT"
        let submitTextStyle = NSMutableParagraphStyle()
        submitTextStyle.alignment = .left
        let submitTextFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize),
            .foregroundColor: UIColor.lightGray,
            .paragraphStyle: submitTextStyle,
        ] as [NSAttributedStringKey: Any]

        let submitTextTextHeight: CGFloat = submitTextTextContent.boundingRect(with: CGSize(width: submitTextRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: submitTextFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: submitTextRect)
        submitTextTextContent.draw(in: CGRect(x: submitTextRect.minX, y: submitTextRect.minY + (submitTextRect.height - submitTextTextHeight) / 2, width: submitTextRect.width, height: submitTextTextHeight), withAttributes: submitTextFontAttributes)
        context.restoreGState()


        //// evaluteText Drawing
        let evaluteTextRect = CGRect(x: 100, y: 18, width: 82, height: 14)
        let evaluteTextTextContent = "EVALUATE"
        let evaluteTextStyle = NSMutableParagraphStyle()
        evaluteTextStyle.alignment = .left
        let evaluteTextFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize),
            .foregroundColor: UIColor.lightGray,
            .paragraphStyle: evaluteTextStyle,
        ] as [NSAttributedStringKey: Any]

        let evaluteTextTextHeight: CGFloat = evaluteTextTextContent.boundingRect(with: CGSize(width: evaluteTextRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: evaluteTextFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: evaluteTextRect)
        evaluteTextTextContent.draw(in: CGRect(x: evaluteTextRect.minX, y: evaluteTextRect.minY + (evaluteTextRect.height - evaluteTextTextHeight) / 2, width: evaluteTextRect.width, height: evaluteTextTextHeight), withAttributes: evaluteTextFontAttributes)
        context.restoreGState()


        //// resolveText Drawing
        let resolveTextRect = CGRect(x: 214, y: 18, width: 73, height: 14)
        let resolveTextTextContent = "RESOLVE"
        let resolveTextStyle = NSMutableParagraphStyle()
        resolveTextStyle.alignment = .left
        let resolveTextFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize),
            .foregroundColor: UIColor.lightGray,
            .paragraphStyle: resolveTextStyle,
        ] as [NSAttributedStringKey: Any]

        let resolveTextTextHeight: CGFloat = resolveTextTextContent.boundingRect(with: CGSize(width: resolveTextRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: resolveTextFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: resolveTextRect)
        resolveTextTextContent.draw(in: CGRect(x: resolveTextRect.minX, y: resolveTextRect.minY + (resolveTextRect.height - resolveTextTextHeight) / 2, width: resolveTextRect.width, height: resolveTextTextHeight), withAttributes: resolveTextFontAttributes)
        context.restoreGState()


        //// closeText Drawing
        let closeTextRect = CGRect(x: 334, y: 18, width: 60, height: 14)
        let closeTextTextContent = "CLOSE"
        let closeTextStyle = NSMutableParagraphStyle()
        closeTextStyle.alignment = .left
        let closeTextFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.labelFontSize),
            .foregroundColor: darkGreyText,
            .paragraphStyle: closeTextStyle,
        ] as [NSAttributedStringKey: Any]

        let closeTextTextHeight: CGFloat = closeTextTextContent.boundingRect(with: CGSize(width: closeTextRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: closeTextFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: closeTextRect)
        closeTextTextContent.draw(in: CGRect(x: closeTextRect.minX, y: closeTextRect.minY + (closeTextRect.height - closeTextTextHeight) / 2, width: closeTextRect.width, height: closeTextTextHeight), withAttributes: closeTextFontAttributes)
        context.restoreGState()


        //// resolvedBlueCircle 3 Drawing
        let resolvedBlueCircle3Path = UIBezierPath(ovalIn: CGRect(x: 131, y: 45, width: 20, height: 20))
        blueCompleteColor.setFill()
        resolvedBlueCircle3Path.fill()


        //// resolvedBlueCircle Drawing
        let resolvedBlueCirclePath = UIBezierPath(ovalIn: CGRect(x: 131, y: 45, width: 20, height: 20))
        blueCompleteColor.setFill()
        resolvedBlueCirclePath.fill()


        //// resolvedBlueCircleComplete Drawing
        let resolvedBlueCircleCompletePath = UIBezierPath(ovalIn: CGRect(x: 240, y: 45, width: 20, height: 20))
        blueCompleteColor.setFill()
        resolvedBlueCircleCompletePath.fill()


        //// closeBlueCircle Drawing
        let closeBlueCirclePath = UIBezierPath(ovalIn: CGRect(x: 354, y: 45, width: 20, height: 20))
        blueCompleteColor.setFill()
        closeBlueCirclePath.fill()


        //// submitCheckMark
        //// Group 4
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 45, y: 45))
        bezier5Path.addCurve(to: CGPoint(x: 48.9, y: 45.78), controlPoint1: CGPoint(x: 46.38, y: 45), controlPoint2: CGPoint(x: 47.68, y: 45.26))
        bezier5Path.addCurve(to: CGPoint(x: 52.08, y: 47.92), controlPoint1: CGPoint(x: 50.12, y: 46.31), controlPoint2: CGPoint(x: 51.18, y: 47.02))
        bezier5Path.addCurve(to: CGPoint(x: 54.22, y: 51.1), controlPoint1: CGPoint(x: 52.98, y: 48.82), controlPoint2: CGPoint(x: 53.69, y: 49.88))
        bezier5Path.addCurve(to: CGPoint(x: 55, y: 55), controlPoint1: CGPoint(x: 54.74, y: 52.32), controlPoint2: CGPoint(x: 55, y: 53.62))
        bezier5Path.addCurve(to: CGPoint(x: 54.22, y: 58.9), controlPoint1: CGPoint(x: 55, y: 56.38), controlPoint2: CGPoint(x: 54.74, y: 57.68))
        bezier5Path.addCurve(to: CGPoint(x: 52.08, y: 62.08), controlPoint1: CGPoint(x: 53.69, y: 60.12), controlPoint2: CGPoint(x: 52.98, y: 61.18))
        bezier5Path.addCurve(to: CGPoint(x: 48.9, y: 64.22), controlPoint1: CGPoint(x: 51.18, y: 62.98), controlPoint2: CGPoint(x: 50.12, y: 63.69))
        bezier5Path.addCurve(to: CGPoint(x: 45, y: 65), controlPoint1: CGPoint(x: 47.68, y: 64.74), controlPoint2: CGPoint(x: 46.38, y: 65))
        bezier5Path.addCurve(to: CGPoint(x: 41.1, y: 64.22), controlPoint1: CGPoint(x: 43.62, y: 65), controlPoint2: CGPoint(x: 42.32, y: 64.74))
        bezier5Path.addCurve(to: CGPoint(x: 37.92, y: 62.08), controlPoint1: CGPoint(x: 39.88, y: 63.69), controlPoint2: CGPoint(x: 38.82, y: 62.98))
        bezier5Path.addCurve(to: CGPoint(x: 35.78, y: 58.9), controlPoint1: CGPoint(x: 37.02, y: 61.18), controlPoint2: CGPoint(x: 36.31, y: 60.12))
        bezier5Path.addCurve(to: CGPoint(x: 35, y: 55), controlPoint1: CGPoint(x: 35.26, y: 57.68), controlPoint2: CGPoint(x: 35, y: 56.38))
        bezier5Path.addCurve(to: CGPoint(x: 35.78, y: 51.1), controlPoint1: CGPoint(x: 35, y: 53.62), controlPoint2: CGPoint(x: 35.26, y: 52.32))
        bezier5Path.addCurve(to: CGPoint(x: 37.92, y: 47.92), controlPoint1: CGPoint(x: 36.31, y: 49.88), controlPoint2: CGPoint(x: 37.02, y: 48.82))
        bezier5Path.addCurve(to: CGPoint(x: 41.1, y: 45.78), controlPoint1: CGPoint(x: 38.82, y: 47.02), controlPoint2: CGPoint(x: 39.88, y: 46.31))
        bezier5Path.addCurve(to: CGPoint(x: 45, y: 45), controlPoint1: CGPoint(x: 42.32, y: 45.26), controlPoint2: CGPoint(x: 43.62, y: 45))
        bezier5Path.close()
        checkMarkColor.setFill()
        bezier5Path.fill()

       
            //// Bezier 6 Drawing
            let bezier6Path = UIBezierPath()
            bezier6Path.move(to: CGPoint(x: 50.33, y: 50))
            bezier6Path.addLine(to: CGPoint(x: 51.93, y: 51.61))
            bezier6Path.addLine(to: CGPoint(x: 43.14, y: 60.54))
            bezier6Path.addLine(to: CGPoint(x: 38, y: 54.92))
            bezier6Path.addLine(to: CGPoint(x: 39.66, y: 53.35))
            bezier6Path.addLine(to: CGPoint(x: 43.2, y: 57.22))
            bezier6Path.addLine(to: CGPoint(x: 50.33, y: 50))
            bezier6Path.close()
            checkMarkWhite.setFill()
            bezier6Path.fill()
    
    
    
    //// evaluateCheckMark
    //// Group
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 141, y: 45))
    bezierPath.addCurve(to: CGPoint(x: 144.9, y: 45.78), controlPoint1: CGPoint(x: 142.38, y: 45), controlPoint2: CGPoint(x: 143.68, y: 45.26))
    bezierPath.addCurve(to: CGPoint(x: 148.08, y: 47.92), controlPoint1: CGPoint(x: 146.12, y: 46.31), controlPoint2: CGPoint(x: 147.18, y: 47.02))
    bezierPath.addCurve(to: CGPoint(x: 150.22, y: 51.1), controlPoint1: CGPoint(x: 148.98, y: 48.82), controlPoint2: CGPoint(x: 149.69, y: 49.88))
    bezierPath.addCurve(to: CGPoint(x: 151, y: 55), controlPoint1: CGPoint(x: 150.74, y: 52.32), controlPoint2: CGPoint(x: 151, y: 53.62))
    bezierPath.addCurve(to: CGPoint(x: 150.22, y: 58.9), controlPoint1: CGPoint(x: 151, y: 56.38), controlPoint2: CGPoint(x: 150.74, y: 57.68))
    bezierPath.addCurve(to: CGPoint(x: 148.08, y: 62.08), controlPoint1: CGPoint(x: 149.69, y: 60.12), controlPoint2: CGPoint(x: 148.98, y: 61.18))
    bezierPath.addCurve(to: CGPoint(x: 144.9, y: 64.22), controlPoint1: CGPoint(x: 147.18, y: 62.98), controlPoint2: CGPoint(x: 146.12, y: 63.69))
    bezierPath.addCurve(to: CGPoint(x: 141, y: 65), controlPoint1: CGPoint(x: 143.68, y: 64.74), controlPoint2: CGPoint(x: 142.38, y: 65))
    bezierPath.addCurve(to: CGPoint(x: 137.1, y: 64.22), controlPoint1: CGPoint(x: 139.62, y: 65), controlPoint2: CGPoint(x: 138.32, y: 64.74))
    bezierPath.addCurve(to: CGPoint(x: 133.92, y: 62.08), controlPoint1: CGPoint(x: 135.88, y: 63.69), controlPoint2: CGPoint(x: 134.82, y: 62.98))
    bezierPath.addCurve(to: CGPoint(x: 131.78, y: 58.9), controlPoint1: CGPoint(x: 133.02, y: 61.18), controlPoint2: CGPoint(x: 132.31, y: 60.12))
    bezierPath.addCurve(to: CGPoint(x: 131, y: 55), controlPoint1: CGPoint(x: 131.26, y: 57.68), controlPoint2: CGPoint(x: 131, y: 56.38))
    bezierPath.addCurve(to: CGPoint(x: 131.78, y: 51.1), controlPoint1: CGPoint(x: 131, y: 53.62), controlPoint2: CGPoint(x: 131.26, y: 52.32))
    bezierPath.addCurve(to: CGPoint(x: 133.92, y: 47.92), controlPoint1: CGPoint(x: 132.31, y: 49.88), controlPoint2: CGPoint(x: 133.02, y: 48.82))
    bezierPath.addCurve(to: CGPoint(x: 137.1, y: 45.78), controlPoint1: CGPoint(x: 134.82, y: 47.02), controlPoint2: CGPoint(x: 135.88, y: 46.31))
    bezierPath.addCurve(to: CGPoint(x: 141, y: 45), controlPoint1: CGPoint(x: 138.32, y: 45.26), controlPoint2: CGPoint(x: 139.62, y: 45))
    bezierPath.close()
    checkMarkColor.setFill()
    bezierPath.fill()
    
    
    
    
    
            //// Bezier 2 Drawing
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 146.32, y: 50))
            bezier2Path.addLine(to: CGPoint(x: 147.93, y: 51.61))
            bezier2Path.addLine(to: CGPoint(x: 139.14, y: 60.54))
            bezier2Path.addLine(to: CGPoint(x: 134, y: 54.92))
            bezier2Path.addLine(to: CGPoint(x: 135.66, y: 53.35))
            bezier2Path.addLine(to: CGPoint(x: 139.2, y: 57.22))
            bezier2Path.addLine(to: CGPoint(x: 146.32, y: 50))
            bezier2Path.close()
            checkMarkWhite.setFill()
            bezier2Path.fill()
    




        //// resolvedCheckMark
        //// Group 2
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 250, y: 45))
        bezier3Path.addCurve(to: CGPoint(x: 253.9, y: 45.78), controlPoint1: CGPoint(x: 251.38, y: 45), controlPoint2: CGPoint(x: 252.68, y: 45.26))
        bezier3Path.addCurve(to: CGPoint(x: 257.08, y: 47.92), controlPoint1: CGPoint(x: 255.12, y: 46.31), controlPoint2: CGPoint(x: 256.18, y: 47.02))
        bezier3Path.addCurve(to: CGPoint(x: 259.21, y: 51.1), controlPoint1: CGPoint(x: 257.98, y: 48.82), controlPoint2: CGPoint(x: 258.69, y: 49.88))
        bezier3Path.addCurve(to: CGPoint(x: 260, y: 55), controlPoint1: CGPoint(x: 259.74, y: 52.32), controlPoint2: CGPoint(x: 260, y: 53.62))
        bezier3Path.addCurve(to: CGPoint(x: 259.21, y: 58.9), controlPoint1: CGPoint(x: 260, y: 56.38), controlPoint2: CGPoint(x: 259.74, y: 57.68))
        bezier3Path.addCurve(to: CGPoint(x: 257.08, y: 62.08), controlPoint1: CGPoint(x: 258.69, y: 60.12), controlPoint2: CGPoint(x: 257.98, y: 61.18))
        bezier3Path.addCurve(to: CGPoint(x: 253.9, y: 64.22), controlPoint1: CGPoint(x: 256.18, y: 62.98), controlPoint2: CGPoint(x: 255.12, y: 63.69))
        bezier3Path.addCurve(to: CGPoint(x: 250, y: 65), controlPoint1: CGPoint(x: 252.68, y: 64.74), controlPoint2: CGPoint(x: 251.38, y: 65))
        bezier3Path.addCurve(to: CGPoint(x: 246.1, y: 64.22), controlPoint1: CGPoint(x: 248.62, y: 65), controlPoint2: CGPoint(x: 247.32, y: 64.74))
        bezier3Path.addCurve(to: CGPoint(x: 242.92, y: 62.08), controlPoint1: CGPoint(x: 244.88, y: 63.69), controlPoint2: CGPoint(x: 243.82, y: 62.98))
        bezier3Path.addCurve(to: CGPoint(x: 240.78, y: 58.9), controlPoint1: CGPoint(x: 242.02, y: 61.18), controlPoint2: CGPoint(x: 241.31, y: 60.12))
        bezier3Path.addCurve(to: CGPoint(x: 240, y: 55), controlPoint1: CGPoint(x: 240.26, y: 57.68), controlPoint2: CGPoint(x: 240, y: 56.38))
        bezier3Path.addCurve(to: CGPoint(x: 240.78, y: 51.1), controlPoint1: CGPoint(x: 240, y: 53.62), controlPoint2: CGPoint(x: 240.26, y: 52.32))
        bezier3Path.addCurve(to: CGPoint(x: 242.92, y: 47.92), controlPoint1: CGPoint(x: 241.31, y: 49.88), controlPoint2: CGPoint(x: 242.02, y: 48.82))
        bezier3Path.addCurve(to: CGPoint(x: 246.1, y: 45.78), controlPoint1: CGPoint(x: 243.82, y: 47.02), controlPoint2: CGPoint(x: 244.88, y: 46.31))
        bezier3Path.addCurve(to: CGPoint(x: 250, y: 45), controlPoint1: CGPoint(x: 247.32, y: 45.26), controlPoint2: CGPoint(x: 248.62, y: 45))
        bezier3Path.close()
        checkMarkColor.setFill()
        bezier3Path.fill()

            //// Bezier 4 Drawing
            let bezier4Path = UIBezierPath()
            bezier4Path.move(to: CGPoint(x: 255.32, y: 50))
            bezier4Path.addLine(to: CGPoint(x: 256.93, y: 51.61))
            bezier4Path.addLine(to: CGPoint(x: 248.14, y: 60.54))
            bezier4Path.addLine(to: CGPoint(x: 243, y: 54.92))
            bezier4Path.addLine(to: CGPoint(x: 244.66, y: 53.35))
            bezier4Path.addLine(to: CGPoint(x: 248.2, y: 57.22))
            bezier4Path.addLine(to: CGPoint(x: 255.32, y: 50))
            bezier4Path.close()
            checkMarkWhite.setFill()
            bezier4Path.fill()

        
        context.restoreGState()

    }

    @objc(ClaimProgressCloseResizingBehavior)
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
