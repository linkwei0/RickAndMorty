//
//  GradientButton.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import UIKit

class GradientButton: UIButton {
    var startColor: UIColor = UIColor.accentYellow
    var endColor: UIColor = UIColor.accent
    
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        gradientLayer.frame = rect
        
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        layer.cornerRadius = rect.height / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.baseBlack.cgColor
        clipsToBounds = true
    }
}
