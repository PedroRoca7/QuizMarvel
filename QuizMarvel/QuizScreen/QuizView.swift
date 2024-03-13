//
//  QuizView.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 09/08/23.
//

import UIKit

class QuizView: UIView {
    
    //MARK: Visual Elements
    
    lazy var personImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleToFill
        element.heightAnchor.constraint(equalToConstant: 265).isActive = true
        return element
    }()
    
    lazy var timeLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .customFontModak(nameFont: .modak, size: 42)
        element.textColor = .white
        element.textAlignment = .center
        element.backgroundColor = .lilas
        return element
    }()
    
    lazy var viewContent: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .backgroundColor
        element.layer.cornerRadius = 20
        return element
    }()
    
    lazy var stackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: buttonArray)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.distribution = .fillEqually
        element.alignment = .leading
        element.spacing = 15
        return element
    }()
    
    lazy var whenPersonLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Quem é nesta imagem?"
        element.font = .systemFont(ofSize: 24, weight: .bold)
        element.textColor = .white
        return element
    }()
    
    lazy var buttonArray: [CustomButton] = {
        var buttonArray: [CustomButton] = []
        
        while buttonArray.count < 4 {
            let button = CustomButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setupImageButton(image: UIImage(named: "ButtonImage\(buttonArray.count)"))
            button.layer.cornerRadius = 20
            button.backgroundColor = .lilas
            button.widthAnchor.constraint(equalToConstant: 350).isActive = true
            buttonArray.append(button)
        }
        return buttonArray
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
        self.addSubview(personImage)
        self.addSubview(timeLabel)
        self.addSubview(viewContent)
        viewContent.addSubview(whenPersonLabel)
        viewContent.addSubview(stackView)
        self.backgroundColor = .white
    }
    
    private func configConstraints() {
 
        NSLayoutConstraint.activate([
                        
            timeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            timeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            personImage.topAnchor.constraint(equalTo: self.topAnchor),
            personImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            personImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            viewContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 245),
            viewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewContent.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30),
            
            whenPersonLabel.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 20),
            whenPersonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: whenPersonLabel.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -40),
            
        ])
        
        timeLabel.layer.cornerRadius = 35
        timeLabel.layer.masksToBounds = true
    }
}
