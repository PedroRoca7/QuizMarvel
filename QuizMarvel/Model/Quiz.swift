//
//  Quiz.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import Foundation

struct Quiz {
    let image: String
    var options: [String]
    let correctedAnswer: String

    public func validadeOption(optionSelected: String) -> Bool {
        
        let answer = optionSelected

        return answer == correctedAnswer
    }
}


