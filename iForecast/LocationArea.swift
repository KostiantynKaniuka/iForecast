//
//  LocationArea.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class LocationArea: UIView {

    override init(frame: CGRect) {
        super.init(frame:frame)
       setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
   
    private func setUpViews() {
        let topImage = makeImageView()
        let cityNameLabel = makeLabel(withText: "London", size: 37)
        let locationButton = makeButton(withText: "Turn on location services")
        topImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topImage)
        addSubview(cityNameLabel)
        addSubview(locationButton)
        
        NSLayoutConstraint.activate([
            topImage.topAnchor.constraint(equalTo: topAnchor),
            topImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 7),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            locationButton.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 12),
            locationButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
