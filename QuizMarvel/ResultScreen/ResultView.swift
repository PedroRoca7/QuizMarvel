//
//  ResultView.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 11/08/23.
//

import UIKit

class ResultView: UIView {
    
    //MARK: Visual Elements
    
    lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 10
        return element
    }()
    
    lazy var titleStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .center
        element.distribution = .fillEqually
        return element
    }()
    
    lazy var titleResultsLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .verdeMarinho
        element.text = "Results"
        element.font = .customFontModak(nameFont: .modak, size: 32)
        return element
    }()
    
    lazy var totalCorrectsAnswered: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .white
        element.text = "Total correct answered"
        element.font = .customFontModak(nameFont: .modak, size: 24)
        return element
    }()
    
    lazy var answeredQuestionsLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .verdeMarinho
        element.font = .customFontModak(nameFont: .modak, size: 22)
        return element
    }()
    
    lazy var scoreLabel: ViewScore = {
        let score = ViewScore()
        score.translatesAutoresizingMaskIntoConstraints = false
        score.backgroundColor = .lilas
        score.layer.cornerRadius = 20
        score.heightAnchor.constraint(equalToConstant: 180).isActive = true
        return score
    }()
    
    lazy var wrongAnswers: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .white
        element.text = "Wrong answers"
        element.font = .customFontModak(nameFont: .modak, size: 22)
        return element
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = .lilas
        tableView.layer.cornerRadius = 20
        tableView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var tryAgainButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .lilas
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = .customFontModak(nameFont: .modak, size: 36)
        element.setTitle("Try Again", for: .normal)
        element.layer.cornerRadius = 20
        element.heightAnchor.constraint(equalToConstant: 65).isActive = true
        return element
    }()
    
    //MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        addElementsView()
        configConstraints()
        setupSpecialConstraintsStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsView() {
        stackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(UIView())
        titleStackView.addArrangedSubview(titleResultsLabel)
        titleStackView.addArrangedSubview(UIView())
        
        stackView.addArrangedSubview(totalCorrectsAnswered)
        stackView.addArrangedSubview(answeredQuestionsLabel)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(wrongAnswers)
        stackView.addArrangedSubview(tableView)
        stackView.addArrangedSubview(tryAgainButton)
        
        self.addSubview(stackView)
        
    }
        
    private func configConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10),
        ])
    }
    
    private func setupSpecialConstraintsStackView() {
        stackView.setCustomSpacing(3, after: totalCorrectsAnswered)
        stackView.setCustomSpacing(3, after: wrongAnswers)
    }
        
}
