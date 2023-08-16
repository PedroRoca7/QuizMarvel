//
//  CustomTableViewCell.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 11/08/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier: String = "CustomTableViewCell"
    
    private lazy var viewCell: CellView = {
        let view = CellView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(viewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareCell(with character: Character) {
        viewCell.nameCorrectLabel.text = "Nome correto: \(character.nameCorrect)"
        viewCell.nameSelectedLabel.text = "Nome selecionado: \(character.nameSelected)"
        if let url = URL(string: character.thumbnail) {
            viewCell.personImageView.kf.indicatorType = .activity
            viewCell.personImageView.kf.setImage(with: url)
        } else {
            viewCell.personImageView.image = nil
        }
    }
}
