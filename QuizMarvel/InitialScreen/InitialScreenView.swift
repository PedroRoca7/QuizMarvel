//
//  InitialScreenView.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 09/08/23.
//

import UIKit

class InitialScreen: UIView {
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "InitialScreen")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.clipsToBounds = true
        
        return backgroundImage
    }()
    
    lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Arial Negrito", size: 20)
        startButton.layer.cornerRadius = 15
        startButton.backgroundColor = .orange
        
        return startButton
    }()
    
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
        self.addSubview(self.startButton)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            self.startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -250),
            self.startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.startButton.heightAnchor.constraint(equalToConstant: 70)
            
            
        ])
        
    }
    
}


