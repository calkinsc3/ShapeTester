//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    //// Color Declarations
    let blueCompleteColor = UIColor(red: 0.098, green: 0.369, blue: 0.690, alpha: 1.000)
    let checkMarkColor = UIColor(red: 0.455, green: 0.620, blue: 0.000, alpha: 1.000)
    let checkMarkWhite = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    let blueProgressColor = UIColor(red: 0.098, green: 0.369, blue: 0.655, alpha: 1.000)
    let greyProgressBarColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.000)
    
    override func loadView() {

        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 10, y: 50))
        linePath.addLine(to: CGPoint(x: 320, y: 50))
        
        //create shape for path
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = blueCompleteColor.cgColor
        shapeLayer.strokeColor = blueCompleteColor.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.path = linePath.cgPath
        
        //animate the line with stroke end
        view.layer.addSublayer(shapeLayer)
        let lineAnimation = CABasicAnimation(keyPath: "strokeEnd")
        lineAnimation.fromValue = 0
        lineAnimation.duration = 4
        lineAnimation.repeatCount = 4
        shapeLayer.add(lineAnimation, forKey: "strokeEnd")
        
        createAnimationGroup()
        fillCircles()
    
    }
    
    func fillCircles() {
        
        
        let evaluateGreyCirclePath = UIBezierPath(ovalIn: CGRect(x: 40, y: 35, width: 40, height: 40))
        let circle1 = CAShapeLayer()
        circle1.fillColor = greyProgressBarColor.cgColor
        circle1.strokeColor = blueCompleteColor.cgColor
        circle1.path = evaluateGreyCirclePath.cgPath
        self.view.layer.addSublayer(circle1)
        
        let completeBlueCirlePath = UIBezierPath(ovalIn: CGRect(x: 150, y: 35, width: 40, height: 40))
        let circle2 = CAShapeLayer()
        circle2.fillColor = blueCompleteColor.cgColor
        circle2.strokeColor = greyProgressBarColor.cgColor
        circle2.path = completeBlueCirlePath.cgPath
        self.view.layer.addSublayer(circle2)
        
        let completeBlue2CirlePath = UIBezierPath(ovalIn: CGRect(x: 200, y: 35, width: 40, height: 40))
        let circle4 = CAShapeLayer()
        circle4.fillColor = blueCompleteColor.cgColor
        circle4.strokeColor = greyProgressBarColor.cgColor
        circle4.path = completeBlue2CirlePath.cgPath
        self.view.layer.addSublayer(circle4)
        
        let completeYellowCirlePath = UIBezierPath(ovalIn: CGRect(x: 175, y: 175, width: 80, height: 80))
        let circle3 = CAShapeLayer()
        circle3.fillColor = blueCompleteColor.cgColor
        circle3.strokeColor = greyProgressBarColor.cgColor
        circle3.lineWidth = 8
        circle3.path = completeYellowCirlePath.cgPath
        self.view.layer.addSublayer(circle3)
        
        
        
    }
    
    //https://stackoverflow.com/questions/42978418/draw-line-animated
    func createAnimationGroup() {
        
        //create a curved path
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 130))
        path.addCurve(to: CGPoint(x: 210, y: 200), controlPoint1: CGPoint(x: 50, y: -100), controlPoint2: CGPoint(x: 100, y: 350))
        
        let curveShapeLayter = CAShapeLayer()
        curveShapeLayter.fillColor = UIColor.white.cgColor
        curveShapeLayter.strokeColor = blueCompleteColor.cgColor
        curveShapeLayter.lineWidth = 5
        curveShapeLayter.path = path.cgPath
        curveShapeLayter.strokeStart = 0.8
        self.view.layer.addSublayer(curveShapeLayter)
        
        let startAnimation = CABasicAnimation(keyPath: "strokeStart")
        startAnimation.fromValue = 0.0
        startAnimation.toValue = 1.0
        
        let endAnimation = CABasicAnimation(keyPath: "strokeEnd")
        endAnimation.fromValue = 0.2
        endAnimation.fromValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [startAnimation, endAnimation]
        animationGroup.duration = 4
        animationGroup.repeatCount = 4
        curveShapeLayter.add(animationGroup, forKey: "MyAnimation")
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
