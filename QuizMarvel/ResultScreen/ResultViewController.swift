//
//  ResultViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    private lazy var viewScreen: ResultView = {
        let view = ResultView()
        
        return view
    }()
    
    var chars: [Character] = []
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    var score: Int = 0
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        configDelegates()
    
        viewScreen.answeredQuestionsLabel.text = "Perguntas respondidas: \(totalAnswers)"
        viewScreen.correctQuestionLabel.text = "Respostas corretas: \(totalCorrectAnswers)"
        viewScreen.wrongQuestionsLabel.text = "Respostas erradas: \(totalAnswers - totalCorrectAnswers)"
        if totalCorrectAnswers != 0 {
            score = (totalCorrectAnswers*100/totalAnswers)
        }
        viewScreen.scoreLabel.text = "\(score)%"

        if chars.count == 0 {
            viewScreen.tableView.isHidden = true
        }
    }
    
    private func configDelegates() {
        viewScreen.tableView.dataSource = self
    }

    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell

        let character = chars[indexPath.row]
        cell?.prepareCell(with: character)

        return cell ?? UITableViewCell()
    }
}
