//
//  DetailView.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 01.11.2022.
//
import UIKit

class DetailView: UIView {
    //MARK: - Outlets
    private let dayIcon = UIImageView()
    private var dayImage: UIImage
    private var dayOfWeek: String
    private var weatherCondition: String
    private var minTemperature: String
    private var maxTemperature: String
    
    
    init(frame: CGRect, dayImage: UIImage, dayOfWeek: String, weatherCondition: String, maxTemperature: String, minTemperature: String) {
        self.dayImage = dayImage
        self.dayImage = dayImage
        self.dayOfWeek = dayOfWeek
        self.weatherCondition = weatherCondition
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 350, height: 20)
    }
}

extension DetailView {
    
    private func makeSectionLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Cabin-Bold", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }
    
    //MARK: - Layout
    private func layout() {
        let dayOfWeekLabel = makeSectionLabel(withText: dayOfWeek)
        let weatherConditionLabel = makeSectionLabel(withText: weatherCondition)
        let minTempLabel = makeSectionLabel(withText: minTemperature)
        let maxTempLabel = makeSectionLabel(withText: maxTemperature)
        
        dayIcon.translatesAutoresizingMaskIntoConstraints = false
        dayIcon.image = dayImage
        dayIcon.tintColor = UIColor.white
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherConditionLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dayIcon)
        addSubview(dayOfWeekLabel)
        addSubview(weatherConditionLabel)
        addSubview(maxTempLabel)
        addSubview(minTempLabel)
        
        NSLayoutConstraint.activate([
            dayIcon.topAnchor.constraint(equalTo: topAnchor),
            dayIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            dayOfWeekLabel.centerYAnchor.constraint(equalTo: dayIcon.centerYAnchor),
            dayOfWeekLabel.leadingAnchor.constraint(equalTo: dayIcon.trailingAnchor, constant: 10),
            
            weatherConditionLabel.centerYAnchor.constraint(equalTo: dayIcon.centerYAnchor),
            weatherConditionLabel.leadingAnchor.constraint(equalTo: dayOfWeekLabel.trailingAnchor),
            
            minTempLabel.centerYAnchor.constraint(equalTo: dayIcon.centerYAnchor),
            minTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            maxTempLabel.centerYAnchor.constraint(equalTo: dayIcon.centerYAnchor),
            maxTempLabel.trailingAnchor.constraint(equalTo: minTempLabel.leadingAnchor)
        ])
    }
}
