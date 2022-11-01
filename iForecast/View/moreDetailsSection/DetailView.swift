//
//  DetailView.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 01.11.2022.
//
import UIKit

class DetailView: UIView {
    
    
    private let dayIcon = UIImageView()
    private let dayOfWeekLabel = UILabel()
    private let weatherConditionLabel = UILabel()
    private let minTempLabel = UILabel()
    private let maxTempLabel = UILabel()
    
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
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 20)
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
    
    private func style() {
        //Icon
        dayIcon.image = dayImage
        
        //DayOfweekLabel
       makeSectionLabel(withText: dayOfWeek)
        
        //WeathetConditionLabel
        weatherConditionLabel.text = dayOfWeek
        weatherConditionLabel.font = UIFont(name: "Cabin-Bold", size: 16)
        weatherConditionLabel.numberOfLines = 0
        weatherConditionLabel.textAlignment = .center
        weatherConditionLabel.textColor = .white
        
        //maxTempLabel
        maxTempLabel.text = dayOfWeek
        maxTempLabel.font = UIFont(name: "Cabin-Bold", size: 16)
        maxTempLabel.numberOfLines = 0
        maxTempLabel.textAlignment = .center
        maxTempLabel.textColor = .white
        
        
        
        
        
        
    }
    
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
