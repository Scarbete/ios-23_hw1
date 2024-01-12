import UIKit



extension UIViewController {
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        let color1 = UIColor(red: 4/255, green: 116/255, blue: 148/255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 74/255, green: 198/255, blue: 233/255, alpha: 1.0).cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
