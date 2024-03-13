//
//  Cell.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 16/08/23.
//

import UIKit

class CellView: UIView {
    
    //MARK: Visual Elements
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[nameCorrectLabel,nameCorrectValueLabel,
                                                      nameSelectedLabel, nameSelectedValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var nameCorrectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .verdeMarinho
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Name Correct"
        return label
    }()
    
    lazy var nameCorrectValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .verdeMarinho
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var nameSelectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Name selected"
        return label
    }()
    
    lazy var nameSelectedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
 
    //MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
        configConstraints()
        setupSpecialSpacingStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsView() {
        self.addSubview(self.personImageView)
        self.addSubview(self.stackView)
        self.backgroundColor = .lilas
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.personImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.personImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.personImageView.widthAnchor.constraint(equalToConstant: 120),
            self.personImageView.heightAnchor.constraint(equalToConstant: 120),
            
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.stackView.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
            self.stackView.heightAnchor.constraint(equalToConstant: 120),
            self.stackView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func setupSpecialSpacingStackView() {
        stackView.setCustomSpacing(2, after: nameCorrectLabel)
        stackView.setCustomSpacing(2, after: nameSelectedLabel)
    }
}
