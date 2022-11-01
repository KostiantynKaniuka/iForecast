//
//  MoreDetailsSection.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 27.10.2022.
//

import UIKit

class MoreDetailsSection: UIView {
    
    let todayWeatherIcon = UIImageView()
    let tomorrowWeatherIcon = UIImageView()
    let otherWeatherDayIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 350)
    }
}

extension MoreDetailsSection {

    private func style() {
      
    }
    
    private func layout() {
      
    }
}
