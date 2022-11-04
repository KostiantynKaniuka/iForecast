//
//  Factories.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8.0

    return stackView
}

func makeImageView(name: String) -> UIImageView {
    let imageView = UIImageView()
    let image = UIImage(named: name)
    imageView.image = image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
}

func makeLabel(withText text: String, fontSize: CGFloat) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false 
    label.textAlignment = .center
    label.numberOfLines = 0
    label.text = text
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
  
    return label
}

func makeButton(withText title: String) -> UIButton {
    let button = UIButton(type: .system)
    let attributedText = NSMutableAttributedString(string: title, attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.kern: 1
    ])
    var config = UIButton.Configuration.filled()
    button.translatesAutoresizingMaskIntoConstraints = false
    config.baseBackgroundColor = .yellowButton
    config.cornerStyle = .capsule
    config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
    button.configuration = config
    button.setAttributedTitle(attributedText, for: .normal)
    
    return button
}

func makeAQIbutton(withText title: String) -> UIButton {
    let image = UIImage(named: "AQIimage") as UIImage?
    let button = UIButton(type: .system)
    let attributedText = NSMutableAttributedString(string: title, attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 23),
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.kern: 1
    ])
    var config = UIButton.Configuration.filled()
    button.translatesAutoresizingMaskIntoConstraints = false
    config.baseBackgroundColor = .yellowButton
    config.cornerStyle = .capsule
    config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
    button.configuration = config
    button.setAttributedTitle(attributedText, for: .normal)
    button.setImage(image, for: .normal)
    
    return button
}

    
