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
        image.layer.cornerRadius = 15
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
        
        return image
    }()
    
    lazy var nameCorrectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var nameSelectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
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
        self.addSubview(self.personImageView)
        self.addSubview(self.nameCorrectLabel)
        self.addSubview(self.nameSelectedLabel)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.personImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.personImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.personImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.personImageView.widthAnchor.constraint(equalToConstant: 95),
            
            self.nameCorrectLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.nameCorrectLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
            self.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            self.nameSelectedLabel.topAnchor.constraint(equalTo: nameCorrectLabel.bottomAnchor, constant: 10),
            self.leadingAnchor.constraint(equalTo: nameCorrectLabel.leadingAnchor),
            self.nameSelectedLabel.trailingAnchor.constraint(equalTo: nameCorrectLabel.trailingAnchor)
        ])
        
        
    }
}
