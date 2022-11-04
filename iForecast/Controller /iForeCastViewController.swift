//
//  ViewController.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

final class iForeCastViewController: UIViewController {
    private let firstScreenStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension iForeCastViewController {
    //MARK: - Style
    private func style() {
        firstScreenStack.axis = .vertical
        firstScreenStack.alignment = .fill
        firstScreenStack.distribution = .fillProportionally
        firstScreenStack.spacing = 30
    }
    
    //MARK: - Layout
    private func layout() {
        let backgroundColorView = Gradient()
        let topLocatorArea = LocationSection()
        let temperatureArea = TemperatureSection()
        let bottomArea = MoreDetailsSection()
        
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        firstScreenStack.translatesAutoresizingMaskIntoConstraints = false
        
        firstScreenStack.addArrangedSubview(topLocatorArea)
        firstScreenStack.addArrangedSubview(temperatureArea)
        firstScreenStack.addArrangedSubview(bottomArea)
        
        view.addSubview(backgroundColorView)
        view.addSubview(firstScreenStack)
        
        NSLayoutConstraint.activate([
            backgroundColorView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            firstScreenStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstScreenStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: firstScreenStack.trailingAnchor, multiplier: 1),
            firstScreenStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
