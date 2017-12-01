//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        self.view = view
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 10, y: 50))
        linePath.addLine(to: CGPoint(x: 200, y: 50))
        
        //create shape for path
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
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
    
    }
    //https://stackoverflow.com/questions/42978418/draw-line-animated
    func createAnimationGroup() {
        
        //create a curved path
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 130))
        path.addCurve(to: CGPoint(x: 210, y: 200), controlPoint1: CGPoint(x: 50, y: -100), controlPoint2: CGPoint(x: 100, y: 350))
        
        let curveShapeLayter = CAShapeLayer()
        curveShapeLayter.fillColor = UIColor.white.cgColor
        curveShapeLayter.strokeColor = UIColor.blue.cgColor
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
