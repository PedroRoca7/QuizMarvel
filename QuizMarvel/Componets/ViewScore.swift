//
//  ViewScore.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 12/03/24.
//

import UIKit

final class ViewScore: UIView {
    var scoreLabel = UILabel()
    private var textFinalScore = UILabel()
    private var viewBall = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        addSubview(textFinalScore)
        textFinalScore.translatesAutoresizingMaskIntoConstraints = false
        textFinalScore.font = .customFontModak(nameFont: .modak, size: 24)
        textFinalScore.textColor = .white
        textFinalScore.text = "Your final score is"
        
        addSubview(viewBall)
        viewBall.translatesAutoresizingMaskIntoConstraints = false
        viewBall.backgroundColor = .yellow
        
        viewBall.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = .customFontModak(nameFont: .modak, size: 64)
        scoreLabel.textColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textFinalScore.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            textFinalScore.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            viewBall.topAnchor.constraint(equalTo: textFinalScore.bottomAnchor, constant: 5),
            viewBall.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewBall.widthAnchor.constraint(equalToConstant: 100),
            viewBall.heightAnchor.constraint(equalToConstant: 100),
            
            scoreLabel.centerXAnchor.constraint(equalTo: viewBall.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: viewBall.centerYAnchor),
        ])
        
        viewBall.layer.cornerRadius = 50
        viewBall.layer.masksToBounds = true
        
    }
}
