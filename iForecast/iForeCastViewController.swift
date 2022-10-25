//
//  ViewController.swift
//  iForecast
//
//  Created by Kostiantyn Kaniuka on 25.10.2022.
//

import UIKit

class iForeCastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     setUpViews()
    }
    
    func setUpViews() {
        let backgroundColorView = Gradient()
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundColorView)
        
        NSLayoutConstraint.activate([
            backgroundColorView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundColorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
}

