//
//  CAGradientLayer.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class Gradient: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    private func setUpGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [
            UIColor.backgroundTop.cgColor,
            UIColor.backgroundBottom.cgColor
        ]
    }
}
