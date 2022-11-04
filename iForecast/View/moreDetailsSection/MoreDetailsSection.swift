//
//  MoreDetailsSection.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 27.10.2022.
//

import UIKit

class MoreDetailsSection: UIView {
    
    private let moreDetailStack = UIStackView()
    private let fiveDayButton = UIButton()

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
        //StackView
        moreDetailStack.axis = .vertical
        moreDetailStack.distribution = .fill
        moreDetailStack.alignment = .fill
        moreDetailStack.spacing = 30
        
        //FiveDayButton
        fiveDayButton.frame.size = CGSize(width: 218, height: 42)
        let attributedText = NSMutableAttributedString(string: "5-day forecast", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
        ])
        var config = UIButton.Configuration.filled()
        fiveDayButton.translatesAutoresizingMaskIntoConstraints = false
        config.baseBackgroundColor = .yellowButton
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50)
        fiveDayButton.configuration = config
        fiveDayButton.setAttributedTitle(attributedText, for: .normal)
    }
      
    private func layout() {
        let todaySection = DetailView(frame: .zero,
                                      dayImage: UIImage(systemName: "sun.max.fill")!,
                                      dayOfWeek: "Today",
                                      weatherCondition: " · Thunderstorm",
                                      maxTemperature: "29° ",
                                      minTemperature: "/ 25°")
        
        let tommorowSection = DetailView(frame: .zero,
                                         dayImage: UIImage(systemName: "cloud.sun.fill")!,
                                         dayOfWeek: "Tommorow",
                                         weatherCondition: " · Cloudy",
                                         maxTemperature: "30°",
                                         minTemperature: "/ 25°")
        
        let thirdDaySection = DetailView(frame: .zero,
                                         dayImage: UIImage(systemName: "cloud.rain")!,
                                         dayOfWeek: "Fri", weatherCondition: " · Thunderstorm",
                                         maxTemperature: "25°",
                                         minTemperature: "/ 20°")
        
       
        moreDetailStack.translatesAutoresizingMaskIntoConstraints = false
        
        moreDetailStack.addArrangedSubview(todaySection)
        moreDetailStack.addArrangedSubview(tommorowSection)
        moreDetailStack.addArrangedSubview(thirdDaySection)
        
        addSubview(moreDetailStack)
        addSubview(fiveDayButton)
    
        NSLayoutConstraint.activate([
            moreDetailStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            moreDetailStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            fiveDayButton.topAnchor.constraint(equalTo: moreDetailStack.bottomAnchor, constant: 30),
            fiveDayButton.centerXAnchor.constraint(equalTo: centerXAnchor)
           
        ])
    }
}
