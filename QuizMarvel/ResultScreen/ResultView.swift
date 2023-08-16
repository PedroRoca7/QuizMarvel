//
//  ResultView.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 11/08/23.
//

import UIKit

class ResultView: UIView {
    
    //MARK: Visual Elements
    
    private lazy var backgroundImage: UIImageView = {
        let backgoundImage = UIImageView()
        backgoundImage.translatesAutoresizingMaskIntoConstraints = false
        backgoundImage.image = UIImage(named: "ImageResult")
        backgoundImage.contentMode = .scaleToFill
        backgoundImage.clipsToBounds = true
        backgoundImage.alpha = 0.6
        
        return backgoundImage
    }()
    
    lazy var answeredQuestionsLabel: UILabel = {
        let answeredQuestion = UILabel()
        answeredQuestion.translatesAutoresizingMaskIntoConstraints = false
        answeredQuestion.textColor = .black
        answeredQuestion.font = UIFont(name: "System Semibold", size: 21)
        answeredQuestion.backgroundColor = .white
        
        return answeredQuestion
    }()
    
    lazy var correctQuestionLabel: UILabel = {
        let correctQuestion = UILabel()
        correctQuestion.translatesAutoresizingMaskIntoConstraints = false
        correctQuestion.textColor = .green
        correctQuestion.font = UIFont(name: "System Semibold", size: 21)
        correctQuestion.backgroundColor = .white
        
        
        return correctQuestion
    }()
    
    lazy var wrongQuestionsLabel: UILabel = {
        let wrongQuestions = UILabel()
        wrongQuestions.translatesAutoresizingMaskIntoConstraints = false
        wrongQuestions.textColor = .red
        wrongQuestions.font = UIFont(name: "System Semibold", size: 21)
        wrongQuestions.backgroundColor = .white
        
        return wrongQuestions
    }()
    
    lazy var scoreLabel: UILabel = {
        let score = UILabel()
        score.translatesAutoresizingMaskIntoConstraints = false
        score.textColor = .black
        score.font = UIFont.systemFont(ofSize: 36)
        score.textAlignment = .center
        score.backgroundColor = .white
        
        return score
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = .clear
        
        return tableView
    }()
    
    lazy var restartButton: UIButton = {
        let restartButton = UIButton()
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.backgroundColor = .orange
        restartButton.setTitle("Reiniciar", for: .normal)
        restartButton.layer.cornerRadius = 15
        restartButton.layer.borderColor = UIColor.black.cgColor
        restartButton.layer.borderWidth = 1
        
        return restartButton
    }()
    
    //MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsView() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.answeredQuestionsLabel)
        self.addSubview(self.correctQuestionLabel)
        self.addSubview(self.wrongQuestionsLabel)
        self.addSubview(self.scoreLabel)
        self.addSubview(self.tableView)
        self.addSubview(self.restartButton)
    }
    
    private func configConstraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.answeredQuestionsLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 25),
            self.answeredQuestionsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.answeredQuestionsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.correctQuestionLabel.topAnchor.constraint(equalTo: answeredQuestionsLabel.bottomAnchor, constant: 15),
            self.correctQuestionLabel.leadingAnchor.constraint(equalTo: answeredQuestionsLabel.leadingAnchor),
            self.correctQuestionLabel.trailingAnchor.constraint(equalTo: answeredQuestionsLabel.trailingAnchor),
            
            self.wrongQuestionsLabel.topAnchor.constraint(equalTo: correctQuestionLabel.bottomAnchor, constant: 15),
            self.wrongQuestionsLabel.leadingAnchor.constraint(equalTo: correctQuestionLabel.leadingAnchor),
            self.wrongQuestionsLabel.trailingAnchor.constraint(equalTo: correctQuestionLabel.trailingAnchor),
            
            self.scoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.scoreLabel.topAnchor.constraint(equalTo: wrongQuestionsLabel.bottomAnchor, constant: 20),
            self.scoreLabel.widthAnchor.constraint(equalToConstant: 100),
            self.scoreLabel.heightAnchor.constraint(equalToConstant: 100),
            
            self.tableView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 15),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: restartButton.topAnchor, constant: -15),
            
            self.restartButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.restartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.restartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60)
            
        ])
    }
    
}
