//
//  MoreDetailsSection.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 27.10.2022.
//

import UIKit

class MoreDetailsSection: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpViews() {
        let todayWeatherIcon = makeImageView(name: "sun.fill", symbol: true)
        let moreDetailsLabel = makeLabel(withText: "More Details>", fontSize: 14)
        
        addSubview(moreDetailsLabel)
        addSubview(todayWeatherIcon)
        addSubview(todayWeatherIcon)
        
        NSLayoutConstraint.activate([
            moreDetailsLabel.topAnchor.constraint(equalTo: topAnchor),
            moreDetailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            todayWeatherIcon.topAnchor.constraint(equalTo: moreDetailsLabel.bottomAnchor, constant: 5),
            todayWeatherIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            
//            tommorowWeatherIcon.topAnchor.constraint(equalTo: todayWeatherIcon.bottomAnchor),
//            tommorowWeatherIcon.centerXAnchor.constraint(equalTo: todayWeatherIcon.centerXAnchor)
            
        ])
       
    }
}
