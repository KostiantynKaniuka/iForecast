//
//  LocationArea.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class LocationSection: UIView {
    
    let topImageView = UIImageView()
    let cityNameLabel = UILabel()
    let locationButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func style() {
        topImageView.image = UIImage(named: "Locator")
        
        //Label
        cityNameLabel.text = "London"
        cityNameLabel.textAlignment = .center
        cityNameLabel.numberOfLines = 0
        cityNameLabel.textColor = .white
        cityNameLabel.font = UIFont.boldSystemFont(ofSize: 37)
        
        //Button
        locationButton.frame.size = CGSize(width: 218, height: 42)
        let attributedText = NSMutableAttributedString(string: "Turn on location services", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
        ])
        var config = UIButton.Configuration.filled()
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        config.baseBackgroundColor = .yellowButton
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        locationButton.configuration = config
        locationButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    private func layout() {
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageView)
        addSubview(cityNameLabel)
        addSubview(locationButton)
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor),
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 7),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            locationButton.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 12),
            locationButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 190)
    }
}
