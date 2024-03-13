//
//  CustomButton.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 12/03/24.
//

import UIKit

class CustomButton: UIButton {
    private let iconImageView = UIImageView()
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        addSubview(iconImageView)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .left
        textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textLabel.font = .systemFont(ofSize: 22, weight: .bold)
        textLabel.textColor = .white
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.5
        
        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonRelased), for: .touchUpInside)
        addTarget(self, action: #selector(buttonRelased), for: .touchUpOutside)
        
    }
    
    @objc private func buttonPressed() {
        backgroundColor = .verdeMarinho
        textLabel.textColor = .backgroundColor
    }
    
    @objc private func buttonRelased() {
        backgroundColor = .lilas
        textLabel.textColor = .white
    }
    
    func setupImageButton(image: UIImage?) {
        iconImageView.image = image
    }
    
    func setupTextButton(text: String) {
        textLabel.text = text
    }
    
}
