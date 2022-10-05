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
}
