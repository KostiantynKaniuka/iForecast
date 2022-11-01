//
//  TemperatureSection.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class TemperatureSection: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func setUpViews() {
        let temperatureLabel = makeLabel(withText: "27", fontSize: 161)
        temperatureLabel.font = UIFont(name: "Cabin-Bold", size: 161)
        let temperatureSymbolLabel = makeLabel(withText: "°C", fontSize: 40)
        let environmentLabel = makeLabel(withText: "Cloudy", fontSize: 34)
        let AQIbutton = makeAQIbutton(withText: "  AQI 14")
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(temperatureLabel)
        addSubview(temperatureSymbolLabel)
        addSubview(environmentLabel)
        addSubview(AQIbutton)
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            temperatureSymbolLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 1),
            temperatureSymbolLabel.topAnchor.constraint(equalTo: topAnchor),
            
            environmentLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            environmentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            AQIbutton.topAnchor.constraint(equalTo: environmentLabel.bottomAnchor, constant: 30),
            AQIbutton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 350)
    }
}
