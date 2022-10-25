//
//  CAGradientLayer.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class Gradient: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    init() {
        super.init(frame:.zero)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
    }
}

extension UIColor {
    static let backGroundTop = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: 1)
}

