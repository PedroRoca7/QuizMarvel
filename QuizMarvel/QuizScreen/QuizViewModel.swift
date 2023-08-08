//
//  QuizManager.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import Foundation

protocol QuizViewModelProtocol: AnyObject {
    func success(heroe: Hero)
    func failure()
}

class QuizViewModel {
    
    var allNamePerson = AllPersonsQuiz()
    var quiz: Quiz?
    weak var delegate: QuizViewModelProtocol?
    private var _totalAnswers = 0
    private var _totalCorrectAnswers = 0
    private var options: [String] = []
    private let urlTest: String = "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
    private var formatImageTest: String = "gif"
    var characters: [Character] = []
    var heroe: Hero?

    var totalAnswers: Int {
        return _totalAnswers
    }
    var totalCorrectAnswers: Int {
        return _totalCorrectAnswers
    }
    
    func loadHeros() {
        
            var nameSort = sortNamePerson()
            
            MarvelAPI.loadHeros(name: nameSort) { [weak self] result in
                guard let self = self else { return }
                
                if let result = result {
                    guard let heroe = result.data.results.first else { return }
                    self.heroe = heroe
                    print("Total:", result.data.total)
                    if self.validadeImageNotFound(thumbnail: heroe.thumbnail.url, formatImage: heroe.thumbnail.formatImage){
                        self.loadHeros()
                    }
                    self.refreshQuiz(thumbnail: heroe.thumbnail.url, name: heroe.name)
                    if heroe.thumbnail.url != self.urlTest && heroe.thumbnail.formatImage != self.formatImageTest {
                        self.delegate?.success(heroe: heroe)
                    }
                } else {
                    self.delegate?.failure()
                }
            }
    }
    
    private func sortNamePerson() -> String {
        let person = allNamePerson.namesPerson
        let numberSort = Int(arc4random_uniform(UInt32(person.count)))
        let nameSort = person[numberSort]
        
        return nameSort
    }
    
    public func resetTotalanswers() {
        _totalAnswers = 0
        _totalCorrectAnswers = 0
    }
    
    private func refreshQuiz(thumbnail: String, name: String) {
        options.removeAll()
        let person = allNamePerson.namesPerson
        
        while options.count < 3 {
            var i = Int(arc4random_uniform(UInt32(person.count)))
            if person[i] != name {
                options.append(person[i])
            }
        }
        options.append(name)
        options.sort()
        print(options)
        
        quiz = Quiz.init(image: thumbnail, options: options, correctedAnswer: name)
    }

    private func validadeImageNotFound(thumbnail: String, formatImage: String) -> Bool {
        
        if thumbnail == urlTest {
            return true
        }
        if formatImage == formatImageTest {
            return true
        } else {
            return false
        }
    }
    
    func validadeAnswer(name: String) {
        _totalAnswers += 1
        guard let quiz = self.quiz else { return }
        if quiz.validadeOption(optionSelected: name) {
            _totalCorrectAnswers += 1
        } else {
            guard let heroe = self.heroe else { return }
            let char = Character.init(thumbnail: heroe.thumbnail.url,nameCorrect: heroe.name, nameSelected: name)
            characters.append(char)
        }
    }
}
