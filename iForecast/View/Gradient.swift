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

extension UIColor {
    static let backgroundTop = UIColor(red: 0/255, green: 92/255, blue: 151/255, alpha: 1)
    static let backgroundBottom = UIColor(red: 54/255, green: 55/255, blue: 149/255, alpha: 1)
    static let yellowButton = UIColor(red: 255/255, green: 178/255, blue: 0/255, alpha: 1)
}
