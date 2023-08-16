//
//  CharactersTableViewCell.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 27/04/23.
//

import UIKit
import Kingfisher

class CharactersTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameCharacterCorrectLabel: UILabel!
    @IBOutlet weak var nameCharacterSelectedLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //prepara a celula para apresentar na tableView
    func prepareCell(with character: Character) {
        nameCharacterCorrectLabel.text = character.nameCorrect
        nameCharacterSelectedLabel.text = character.nameSelected
        if let url = URL(string: character.thumbnail) {
            thumbImageView.kf.indicatorType = .activity
            thumbImageView.kf.setImage(with: url)
        } else {
            thumbImageView.image = nil
        }
    }
}
