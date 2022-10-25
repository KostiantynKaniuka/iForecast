//
//  ViewController.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

final class iForeCastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        let backgroundColorView = Gradient()
        let topLocatorArea = LocationSection()
        let temperatureArea = TemperatureSection()
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        topLocatorArea.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(backgroundColorView)
        view.addSubview(topLocatorArea)
        view.addSubview(temperatureArea)
        
        NSLayoutConstraint.activate([
            backgroundColorView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topLocatorArea.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLocatorArea.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            temperatureArea.topAnchor.constraint(equalTo: topLocatorArea.bottomAnchor),
            temperatureArea.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

