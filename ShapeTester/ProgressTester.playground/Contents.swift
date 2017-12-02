//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        view.addSubview(ClaimEvaluateProgressView())
        
        
        
    }
}

class ClaimEvaluateProgressView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        ClaimProgressEvaluate.drawClaimProgressBar()
    }
    
}

class ClaimResolveProgressView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
    }
    
}

class ClaimCloseProgressView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
    }
    
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
