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
    var currentScore = 0
    
    
    // MARK: OBJECTS
    
    // Random Color Box
    public lazy var randomColorBox: UIImageView = {
        let mainBox = UIImageView()
        mainBox.backgroundColor = .white //have to change to combo color
        return mainBox
    }()
    
    public lazy var correctIncorrectLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "Correct or Incorrect"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
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
    
    
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: colorButtons())
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private func colorButtons() -> [UIButton] {
        let redButton = UIButton()
        redButton.backgroundColor = .systemRed
        let greenButton = UIButton()
        greenButton.backgroundColor = .systemGreen
        let blueButton = UIButton()
        blueButton.backgroundColor = .systemBlue
        let allButtons = [redButton, greenButton, blueButton]
        return allButtons
    }
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.setTitle("  Play Again  ", for: .normal)
        return button
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
        setupCorrectIncorrectLabelConstraints()
        setupHighScoreTextConstraints()
        setupCurrentScoreTextConstraints()
        setupHighScoreConstraints()
        setupCurrentScoreConstraints()
        setupButtonStackViewConstraints()
        playAgainButtonConstraints()
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
    
    private func setupCorrectIncorrectLabelConstraints() {
        addSubview(correctIncorrectLabel)
        correctIncorrectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            correctIncorrectLabel.topAnchor.constraint(equalTo: randomColorBox.bottomAnchor, constant: 20),
            correctIncorrectLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            correctIncorrectLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            correctIncorrectLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupHighScoreTextConstraints() {
        addSubview(highScoreLabel)
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highScoreLabel.topAnchor.constraint(equalTo: correctIncorrectLabel.bottomAnchor, constant: 20),
            highScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    private func setupCurrentScoreTextConstraints() {
        addSubview(currentScoreLabel)
        currentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentScoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 20),
            currentScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    
    private func setupHighScoreConstraints() {
        addSubview(highScoreLabelField)
        highScoreLabelField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            highScoreLabelField.topAnchor.constraint(equalTo: correctIncorrectLabel.bottomAnchor, constant: 20),
            highScoreLabelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func setupCurrentScoreConstraints() {
        addSubview(currentScoreLabelField)
        currentScoreLabelField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentScoreLabelField.topAnchor.constraint(equalTo: highScoreLabelField.bottomAnchor, constant: 20),
            currentScoreLabelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func setupButtonStackViewConstraints() {
        addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: currentScoreLabel.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            buttonStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func playAgainButtonConstraints() {
        addSubview(playAgainButton)
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        playAgainButton.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 40),
        playAgainButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
    
    
}
