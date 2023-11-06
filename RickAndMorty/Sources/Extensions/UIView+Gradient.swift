//
//  UIView+Gradient.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import UIKit

extension UIView {
    func applyGradient(colours: [UIColor]) {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [colours[0].cgColor, colours[1].cgColor]
        gradientLayer.frame = bounds
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.baseBlack.cgColor
        clipsToBounds = true
    }
}
