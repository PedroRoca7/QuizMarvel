//
//  ResultViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import RxSwift
import RxCocoa

class ResultViewController: UIViewController {
    
    private lazy var viewScreen: ResultView = {
        let view = ResultView()
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    var chars: [Character] = []
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    var score: Int = 0
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        configDelegates()
    
        viewScreen.answeredQuestionsLabel.text = "\(totalCorrectAnswers) out of \(totalAnswers) Questions"
        if totalCorrectAnswers != 0 {
            score = (totalCorrectAnswers*100/totalAnswers)
        }
        viewScreen.scoreLabel.scoreLabel.text = "\(score)"

        if chars.count == 0 {
            viewScreen.tableView.isHidden = true
        }
        
        viewScreen.tryAgainButton.rx.tap.bind {
            self.navigationController?.pushViewController(QuizViewController(), animated: true)
        }.disposed(by: disposeBag)
    }
    
    private func configDelegates() {
        viewScreen.tableView.dataSource = self
        viewScreen.tableView.delegate = self
    }
}

extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        let character = chars[indexPath.row]
        cell?.prepareCell(with: character)
        
        return cell ?? UITableViewCell()
    }
        
    //MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
