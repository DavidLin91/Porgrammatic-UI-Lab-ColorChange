//
//  MainView.swift
//  Porgrammatic-UI-Lab-ColorChange
//
//  Created by David Lin on 1/28/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var score = 0
    var highScore = 0
    
    
    // MARK: OBJECTS
    
    private var highScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "HIGH SCORE:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private var currentScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "CURRENT SCORE:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    public lazy var highScoreLabelField: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = highScore.description
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()

   public lazy var currentScoreLabelField: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = score.description
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    // Random Color Box
    public lazy var randomColorBox: UIImageView = {
        let mainBox = UIImageView()
        mainBox.backgroundColor = .white //have to change to combo color
        return mainBox
    }()
    
    private lazy var stackView: UIStackView = {
    
    }()
    
    
    // MARK: INITS
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
        setupHighScoreTextConstraints()
        setupCurrentScoreTextConstraints()
        setupHighScoreConstraints()
        setupCurrentScoreConstraints()
    }
    
    
    
    // MARK: CONSTRAINTS
    private func setupColorBoxConstraints() {
        addSubview(randomColorBox)
        randomColorBox.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            randomColorBox.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            randomColorBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            randomColorBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            randomColorBox.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupHighScoreTextConstraints() {
        addSubview(highScoreLabel)
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highScoreLabel.topAnchor.constraint(equalTo: randomColorBox.bottomAnchor, constant: 40),
            highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    private func setupCurrentScoreTextConstraints() {
        addSubview(currentScoreLabel)
        currentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        currentScoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 30),
        currentScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    
    private func setupHighScoreConstraints() {
        addSubview(highScoreLabelField)
        highScoreLabelField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        highScoreLabelField.topAnchor.constraint(equalTo: randomColorBox.bottomAnchor, constant: 40),
        highScoreLabelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func setupCurrentScoreConstraints() {
        addSubview(currentScoreLabelField)
        currentScoreLabelField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        currentScoreLabelField.topAnchor.constraint(equalTo: highScoreLabelField.bottomAnchor, constant: 30),
        currentScoreLabelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    
    
}
