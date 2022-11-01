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
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MoreDetailsSection {

    private func style() {
      
    }
    
    private func layout() {
        let todaySection = DetailView(frame: .zero,
                                      dayImage: UIImage(systemName: "sun.max.fill")!,
                                      dayOfWeek: "Today",
                                      weatherCondition: " · Thunderstorm",
                                      maxTemperature: "29° ",
                                      minTemperature: "/ 25°")
        todaySection.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(todaySection)
        
        NSLayoutConstraint.activate([
            todaySection.centerYAnchor.constraint(equalTo: centerYAnchor),
            todaySection.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
      
    }
}
