//
//  InitialScreenView.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 09/08/23.
//

import UIKit

class InitialScreen: UIView {
    
    lazy var stackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [logoImage, letsPlayLabel, playNowButton, aboutButton])
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 45
        return element
    }()
    
    lazy var logoImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "MarvelLogo")
        element.contentMode = .scaleAspectFit
        element.clipsToBounds = true
        element.widthAnchor.constraint(equalToConstant: 280).isActive = true
        element.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return element
    }()
    
    lazy var letsPlayLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Let's play!"
        element.font = .customFontModak(nameFont: .modak, size: 48)
        element.textColor = .white
        return element
    }()
    
    lazy var playNowButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("Play Now", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = .customFontModak(nameFont: .modak, size: 36)
        element.layer.cornerRadius = 20
        element.backgroundColor = .lilas
        element.widthAnchor.constraint(equalToConstant: 180).isActive = true
        element.heightAnchor.constraint(equalToConstant: 65).isActive = true
        return element
    }()
    
    lazy var aboutButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("About", for: .normal)
        element.setTitleColor(.lilas, for: .normal)
        element.titleLabel?.font = .customFontModak(nameFont: .modak, size: 36)
        element.layer.cornerRadius = 20
        element.layer.borderWidth = 1
        element.layer.borderColor = UIColor.lilas?.cgColor
        element.backgroundColor = .clear
        element.widthAnchor.constraint(equalToConstant: 180).isActive = true
        element.heightAnchor.constraint(equalToConstant: 65).isActive = true
        return element
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
        self.backgroundColor = .backgroundColor
        self.addSubview(stackView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
        ])
    }
}
