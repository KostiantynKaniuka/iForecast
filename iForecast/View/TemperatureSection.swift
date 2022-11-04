//
//  TemperatureSection.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class TemperatureSection: UIView {
    private let AQIbutton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - intrinsicContentSize
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 250)
    }
}

extension TemperatureSection {
    
    private func makeSectionLabel(withText text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Cabin-Bold", size: size)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }
    
    //MARK: - Style
    private func style() {
        //AQIbuttom
        let image = UIImage(named: "AQIimage") as UIImage?
        let attributedText = NSMutableAttributedString(string: "  AQI 14", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
        ])
        var config = UIButton.Configuration.filled()
        AQIbutton.translatesAutoresizingMaskIntoConstraints = false
        config.baseBackgroundColor = .yellowButton
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        AQIbutton.configuration = config
        AQIbutton.setAttributedTitle(attributedText, for: .normal)
        AQIbutton.setImage(image, for: .normal)
    }
    
    //MARK: - Layout
    private func layout() {
        let temperatureLabel = makeSectionLabel(withText: "27", size: 161)
        let temperatureSymbolLabel = makeSectionLabel(withText: "°C", size: 40)
        let environmentLabel = makeSectionLabel(withText: "Cloudy", size: 34)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureSymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        environmentLabel.translatesAutoresizingMaskIntoConstraints = false
        AQIbutton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(temperatureLabel)
        addSubview(temperatureSymbolLabel)
        addSubview(environmentLabel)
        addSubview(AQIbutton)
        
        NSLayoutConstraint.activate([
            temperatureSymbolLabel.topAnchor.constraint(equalTo: topAnchor),
            temperatureSymbolLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
            
            temperatureLabel.heightAnchor.constraint(equalToConstant: 150),
            temperatureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            environmentLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            environmentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            AQIbutton.topAnchor.constraint(equalTo: environmentLabel.bottomAnchor, constant: 15),
            AQIbutton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
