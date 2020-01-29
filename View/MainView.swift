//
//  MainView.swift
//  Porgrammatic-UI-Lab-ColorChange
//
//  Created by David Lin on 1/28/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var colorBox: UIView = {
        let mainBox = UIView()
        mainBox.frame.size.width = 200
        mainBox.frame.size.height = 200
        mainBox.backgroundColor = .systemBlue //have to change to combo color
        return mainBox
    }()
    
    
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupColorBoxConstraints()
        setupResetButtonConstraints()
    }
    
    private func setupColorBoxConstraints() {
        addSubview(colorBox)
        colorBox.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorBox.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            colorBox.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // resetButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        // set constaints
        NSLayoutConstraint.activate([
        resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        resetButton.topAnchor.constraint(equalTo: colorBox.bottomAnchor, constant: 40)
        
        ])
    }

    
    
    
}
