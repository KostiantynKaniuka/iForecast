//
//  UiView.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 23.01.2023.
//

import UIKit

extension UIView {
    
    func add(subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}
