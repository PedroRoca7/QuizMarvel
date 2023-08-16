//
//  QuizView.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 09/08/23.
//

import UIKit

class QuizView: UIView {
    
    //MARK: Visual Elements
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.clipsToBounds = true
        
        return backgroundImage
    }()
    
    lazy var personImage: UIImageView = {
        let personImage = UIImageView()
        personImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.contentMode = .scaleToFill
        
        return personImage
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 32)
        timeLabel.textColor = .white
        timeLabel.layer.borderColor = UIColor.black.cgColor
        timeLabel.layer.borderWidth = 1
                
        return timeLabel
    }()
    
    lazy var timerSlider: UISlider = {
        let timeSlider = UISlider()
        timeSlider.translatesAutoresizingMaskIntoConstraints = false
        timeSlider.minimumValue = 0
        timeSlider.maximumValue = 120
        timeSlider.value = 120
        
        return timeSlider
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        return stackView
    }()
    
    lazy var buttonArray: [UIButton] = {
        var buttonArray: [UIButton] = []
        
        while buttonArray.count < 4 {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .orange
        
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
        
        self.addSubview(self.backgroundImage)
        self.addSubview(self.timeLabel)
        self.addSubview(self.personImage)
        self.addSubview(self.timerSlider)
        self.addSubview(self.stackView)
        
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.timeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 55),
        
            self.timerSlider.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.timerSlider.trailingAnchor.constraint(equalTo: self.timeLabel.leadingAnchor, constant: -7),
            self.timerSlider.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor),
            
            self.personImage.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 7),
            self.personImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.personImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: self.personImage.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
