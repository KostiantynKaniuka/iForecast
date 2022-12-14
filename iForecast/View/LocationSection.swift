//
//  LocationArea.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class LocationSection: UIView {
    
    private let topImageView = UIImageView()
    private let cityNameLabel = UILabel()
    private let locationButton = UIButton()
    
    //MARK: - intrinsicContentSize
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 120)
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension LocationSection {
    //MARK: - Setup
    private func setup() {
        locationButton.addTarget(self, action: #selector(locationServicesActivation), for: .primaryActionTriggered)
    }
    
    //MARK: - Style
    private func style() {
        topImageView.image = UIImage(named: "Locator")
        
        //Label
        cityNameLabel.text = "London"
        cityNameLabel.textAlignment = .center
        cityNameLabel.numberOfLines = 0
        cityNameLabel.textColor = .white
        cityNameLabel.font = UIFont(name: "Cabin-Bold", size: 37)
        
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
    
    //MARK: - Layout
    private func layout() {
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageView)
        addSubview(cityNameLabel)
        addSubview(locationButton)
        
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor),
            topImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 7),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            locationButton.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 12),
            locationButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

//MARK: - Actions
extension LocationSection {
    @objc func locationServicesActivation(sender: UIButton) {
        for _ in 1...10 {
            animateLocationIcon(duration: 5)
        }
    }
    
    //animation
    private func animateLocationIcon(duration: Double) {
        UIView.animate(withDuration: duration) {
            self.topImageView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseIn
        ) {
            self.topImageView.transform = CGAffineTransform(rotationAngle: 2 * .pi)
        }
    }
    
}
