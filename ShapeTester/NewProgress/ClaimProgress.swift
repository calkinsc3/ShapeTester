//
//  ClaimProgress.swift
//  Claims
//
//  Created by Bill Calkins on 12/1/17.
//  Copyright © 2017 (null). All rights reserved.
//
//



import UIKit

public class ClaimProgressBar : NSObject {
    
    //// Drawing Methods
    
    @objc dynamic public class func drawClaimProgressBar(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 320, height: 120),
                                                         resizing: ResizingBehavior = .aspectFit,
                                                         cgLayerToAnimate: CALayer,
                                                         claimProgress: String) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 400, height: 120), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 400, y: resizedFrame.height / 120)
        
        
        //// Color Declarations
        let blueCompleteColor = UIColor(red: 0.098, green: 0.369, blue: 0.690, alpha: 1.000)
        let checkMarkColor = UIColor(red: 0.455, green: 0.620, blue: 0.000, alpha: 1.000)
        let checkMarkWhite = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        let blueProgressColor = UIColor(red: 0.098, green: 0.369, blue: 0.655, alpha: 1.000)
        let greyProgressBarColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.000)
        
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
        
        
        //// resolvedBlueCircle Drawing
        let resolvedBlueCirclePath = UIBezierPath(ovalIn: CGRect(x: 240, y: 45, width: 20, height: 20))
        blueCompleteColor.setFill()
        resolvedBlueCirclePath.fill()
        
        
        //// blueProgressBar Drawing
        let blueProgressBarPath = UIBezierPath()
        blueProgressBarPath.move(to: CGPoint(x: 41, y: 57))
        blueProgressBarPath.addLine(to: CGPoint(x: 364, y: 57))
        blueProgressBarPath.addLine(to: CGPoint(x: 364, y: 53))
        blueProgressBarPath.addLine(to: CGPoint(x: 41, y: 53))
        blueProgressBarPath.addLine(to: CGPoint(x: 41, y: 57))
        blueProgressBarPath.close()
        
        //blueProgressColor.setFill()
        //blueProgressBarPath.fill()
        
        
        //create shape for path
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = blueProgressColor.cgColor
        shapeLayer.strokeColor = blueCompleteColor.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.path = blueProgressBarPath.cgPath
        
        //animate the line with stroke end
        cgLayerToAnimate.addSublayer(shapeLayer)
        let lineAnimation = CABasicAnimation(keyPath: "strokeEnd")
        lineAnimation.fromValue = 0
        lineAnimation.toValue = 1
        lineAnimation.duration = 8
        shapeLayer.add(lineAnimation, forKey: "strokeEnd")
        
//        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        progressAnimation.fromValue = 0.0
//        progressAnimation.toValue = 0.5
//        progressAnimation.duration = 1.0
//        cgLayerToAnimate.removeAnimation(forKey: "strokeEnd")
//        cgLayerToAnimate.add(progressAnimation, forKey: nil)
        
        //// greenCheckDone
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
        
        
        //// submitGreenCircle
        //// Group 3
        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 45, y: 45))
        bezier7Path.addCurve(to: CGPoint(x: 48.9, y: 45.78), controlPoint1: CGPoint(x: 46.38, y: 45), controlPoint2: CGPoint(x: 47.68, y: 45.26))
        bezier7Path.addCurve(to: CGPoint(x: 52.08, y: 47.92), controlPoint1: CGPoint(x: 50.12, y: 46.31), controlPoint2: CGPoint(x: 51.18, y: 47.02))
        bezier7Path.addCurve(to: CGPoint(x: 54.22, y: 51.1), controlPoint1: CGPoint(x: 52.98, y: 48.82), controlPoint2: CGPoint(x: 53.69, y: 49.88))
        bezier7Path.addCurve(to: CGPoint(x: 55, y: 55), controlPoint1: CGPoint(x: 54.74, y: 52.32), controlPoint2: CGPoint(x: 55, y: 53.62))
        bezier7Path.addCurve(to: CGPoint(x: 54.22, y: 58.9), controlPoint1: CGPoint(x: 55, y: 56.38), controlPoint2: CGPoint(x: 54.74, y: 57.68))
        bezier7Path.addCurve(to: CGPoint(x: 52.08, y: 62.08), controlPoint1: CGPoint(x: 53.69, y: 60.12), controlPoint2: CGPoint(x: 52.98, y: 61.18))
        bezier7Path.addCurve(to: CGPoint(x: 48.9, y: 64.22), controlPoint1: CGPoint(x: 51.18, y: 62.98), controlPoint2: CGPoint(x: 50.12, y: 63.69))
        bezier7Path.addCurve(to: CGPoint(x: 45, y: 65), controlPoint1: CGPoint(x: 47.68, y: 64.74), controlPoint2: CGPoint(x: 46.38, y: 65))
        bezier7Path.addCurve(to: CGPoint(x: 41.1, y: 64.22), controlPoint1: CGPoint(x: 43.62, y: 65), controlPoint2: CGPoint(x: 42.32, y: 64.74))
        bezier7Path.addCurve(to: CGPoint(x: 37.92, y: 62.08), controlPoint1: CGPoint(x: 39.88, y: 63.69), controlPoint2: CGPoint(x: 38.82, y: 62.98))
        bezier7Path.addCurve(to: CGPoint(x: 35.78, y: 58.9), controlPoint1: CGPoint(x: 37.02, y: 61.18), controlPoint2: CGPoint(x: 36.31, y: 60.12))
        bezier7Path.addCurve(to: CGPoint(x: 35, y: 55), controlPoint1: CGPoint(x: 35.26, y: 57.68), controlPoint2: CGPoint(x: 35, y: 56.38))
        bezier7Path.addCurve(to: CGPoint(x: 35.78, y: 51.1), controlPoint1: CGPoint(x: 35, y: 53.62), controlPoint2: CGPoint(x: 35.26, y: 52.32))
        bezier7Path.addCurve(to: CGPoint(x: 37.92, y: 47.92), controlPoint1: CGPoint(x: 36.31, y: 49.88), controlPoint2: CGPoint(x: 37.02, y: 48.82))
        bezier7Path.addCurve(to: CGPoint(x: 41.1, y: 45.78), controlPoint1: CGPoint(x: 38.82, y: 47.02), controlPoint2: CGPoint(x: 39.88, y: 46.31))
        bezier7Path.addCurve(to: CGPoint(x: 45, y: 45), controlPoint1: CGPoint(x: 42.32, y: 45.26), controlPoint2: CGPoint(x: 43.62, y: 45))
        bezier7Path.close()
        checkMarkColor.setFill()
        bezier7Path.fill()
        
        
        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 50.33, y: 50))
        bezier8Path.addLine(to: CGPoint(x: 51.93, y: 51.61))
        bezier8Path.addLine(to: CGPoint(x: 43.14, y: 60.54))
        bezier8Path.addLine(to: CGPoint(x: 38, y: 54.92))
        bezier8Path.addLine(to: CGPoint(x: 39.66, y: 53.35))
        bezier8Path.addLine(to: CGPoint(x: 43.2, y: 57.22))
        bezier8Path.addLine(to: CGPoint(x: 50.33, y: 50))
        bezier8Path.close()
        checkMarkWhite.setFill()
        bezier8Path.fill()
        
        //// resolvedBlueCircle 2 Drawing
        let resolvedBlueCircle2Path = UIBezierPath(ovalIn: CGRect(x: 354, y: 45, width: 20, height: 20))
        blueCompleteColor.setFill()
        resolvedBlueCircle2Path.fill()
        
        
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
            .foregroundColor: UIColor.lightGray,
            .paragraphStyle: closeTextStyle,
            ] as [NSAttributedStringKey: Any]
        
        let closeTextTextHeight: CGFloat = closeTextTextContent.boundingRect(with: CGSize(width: closeTextRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: closeTextFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: closeTextRect)
        closeTextTextContent.draw(in: CGRect(x: closeTextRect.minX, y: closeTextRect.minY + (closeTextRect.height - closeTextTextHeight) / 2, width: closeTextRect.width, height: closeTextTextHeight), withAttributes: closeTextFontAttributes)
        context.restoreGState()
        
        context.restoreGState()
        
    }
    
    
    
    
    @objc(ClaimProgressResizingBehavior)
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
