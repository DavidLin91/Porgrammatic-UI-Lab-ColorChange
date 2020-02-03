//
//  MainView.swift
//  Porgrammatic-UI-Lab-ColorChange
//
//  Created by David Lin on 1/28/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var currentScore = 0
    var highScore = 0
    var yourScore = 0
    var counter = 0
    
    let redButton = UIButton()
    let greenButton = UIButton()
    let blueButton = UIButton()
    let mainBox = UIImageView()
    
    // MARK: OBJECTS
    
    // Random Color Box
    public lazy var randomColorBox: UIImageView = {
        mainBox.backgroundColor = randomNewColor()
        return mainBox
    }()
    
    @objc private func randomNewColor() -> UIColor {
        let randNumRed = CGFloat.random(in: 0...1)
        let randNumGreen = CGFloat.random(in: 0...1)
        let randNumBlue = CGFloat.random(in: 0...1)
        let randNumAlpha = CGFloat.random(in: 0...1)
        let myColor = UIColor(red: randNumRed, green: randNumGreen, blue: randNumBlue, alpha: randNumAlpha)
        
        let numRedInt:Float = Float(randNumRed)
        let numGreenInt:Float = Float(randNumGreen)
        let numBlueInt: Float = Float(randNumBlue)
        
        if numRedInt > numGreenInt && numRedInt > numBlueInt {
            counter = 0
        } else if numGreenInt > numRedInt && numGreenInt > numBlueInt {
            counter = 1
        } else if numBlueInt > numRedInt && numBlueInt > numGreenInt {
            counter = 2
        } else if numRedInt == numGreenInt && numRedInt == numBlueInt && numBlueInt == numGreenInt {
            mainBox.backgroundColor = randomNewColor()
        }
        
        return myColor
    }
    
    
    
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
    
    private var yourScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR SCORE:"
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
    
    public lazy var yourScoreLabelField: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = currentScore.description
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
        redButton.backgroundColor = .systemRed
        redButton.tag = 0
        redButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        greenButton.backgroundColor = .systemGreen
        greenButton.tag = 1
        greenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        blueButton.backgroundColor = .systemBlue
        blueButton.tag = 2
        blueButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let allButtons = [redButton, greenButton, blueButton]
        return allButtons
    }
    
    @objc
    private func buttonPressed(_ sender: UIButton) {
        if sender.tag == counter {
            yourScore += 1
            yourScoreLabelField.text = String(yourScore)
            correctIncorrectLabel.text = "🎉 CORRECT 🎉"
            mainBox.backgroundColor = randomNewColor()
            currentScore = yourScore
            
        } else if sender.tag != counter {
            redButton.isEnabled = false
            greenButton.isEnabled = false
            blueButton.isEnabled = false
            correctIncorrectLabel.text = " 💀 GAME OVER 💀"
            if yourScore > highScore {
                highScoreLabelField.text = yourScoreLabelField.text
            } else {
                highScoreLabelField.text = String(highScore)
            }
        }
    }
    
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(playAgainButtonPressed(_:)), for: .touchUpInside)
        button.setTitle("  Play Again  ", for: .normal)
        return button
    }()
    
    
    @objc private func playAgainButtonPressed(_ sender: UIButton) {
        if currentScore > highScore {
            highScore = currentScore
            highScoreLabelField.text = String(highScore)
        } else if currentScore < highScore {
            highScoreLabelField.text = String(highScore)
        }
        correctIncorrectLabel.text = " "
        redButton.isEnabled = true
        greenButton.isEnabled = true
        blueButton.isEnabled = true
        mainBox.backgroundColor = randomNewColor()
        yourScore = 0
        yourScoreLabelField.text = "0"
    }
    
    
    
    
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
        addSubview(yourScoreLabel)
        yourScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourScoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 20),
            yourScoreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
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
        addSubview(yourScoreLabelField)
        yourScoreLabelField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yourScoreLabelField.topAnchor.constraint(equalTo: highScoreLabelField.bottomAnchor, constant: 20),
            yourScoreLabelField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func setupButtonStackViewConstraints() {
        addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: yourScoreLabel.bottomAnchor, constant: 20),
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
