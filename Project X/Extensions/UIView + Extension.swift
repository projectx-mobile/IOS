//
//  UIView + Extension.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.primaryMidnight.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2.5, height: 3.0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
    }
    
    func addSmallShadowOnView() {
        layer.shadowColor = UIColor.primaryMidnight.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 1.4, height: 1.6)
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
    }
    func createCustomViewWithShadow(_ corners: UIRectCorner, radius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?, fillColor: UIColor?, shadowColor: UIColor) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor?.cgColor
        layer.insertSublayer(shapeLayer, at: 0)
        
        layer.shadowRadius = 0
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 2.5, height: 3)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = path.cgPath
        
        if borderWidth != nil {
            addBorder(shapeLayer, borderWidth: borderWidth!, borderColor: borderColor!)
        }
    }
    
    private func addBorder(_ shapeLayer: CAShapeLayer, borderWidth: CGFloat, borderColor: UIColor) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = shapeLayer.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
    func createCustomView(_ corners: UIRectCorner, radius: CGFloat, borderColor: UIColor?, borderWidth: CGFloat?, fillColor: UIColor?) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor?.cgColor
        layer.insertSublayer(shapeLayer, at: 0)
        
        if borderWidth != nil {
            addBorder(shapeLayer, borderWidth: borderWidth!, borderColor: borderColor!)
        }
    }
    // MARK: InnerShadow
    func innerShadowForView(to edges: [ UIRectEdge ], radius: CGFloat, opacity: Float, color: CGColor, name: String) {
        let fromColor = color
        let toColor = UIColor.clear.cgColor
        let viewFrame = self.frame
        for edge in edges {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [ fromColor, toColor ]
            gradientLayer.opacity = opacity
            gradientLayer.name = name
            gradientLayer.cornerRadius = self.layer.cornerRadius
            switch edge {
            case .top:
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: radius)
            case .bottom:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.frame = CGRect(x: 0.0, y: viewFrame.height - radius, width: viewFrame.width, height: radius)
            case .left:
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: radius, height: viewFrame.height)
            case .right:
                gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.frame = CGRect(x: viewFrame.width - radius, y: 0.0, width: radius, height: viewFrame.height)
            default:
                break
            }
            self.layer.addSublayer(gradientLayer)
        }
    }
}
