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
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews:[nameCorrectLabel, nameSelectedLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        
        return stackView
    }()
    
    lazy var nameCorrectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        return label
    }()
    
    lazy var nameSelectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
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
        self.addSubview(self.stackView)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.personImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.personImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.personImageView.widthAnchor.constraint(equalToConstant: 80),
            self.personImageView.heightAnchor.constraint(equalToConstant: 80),
            
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            self.stackView.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
            self.stackView.widthAnchor.constraint(equalToConstant: 200),
            self.stackView.heightAnchor.constraint(equalToConstant: 80)
            
        ])
        
        
    }
}
