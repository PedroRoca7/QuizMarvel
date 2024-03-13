//
//  QuizViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class QuizViewController: UIViewController {
    
    private lazy var viewScreen: QuizView = {
        let view = QuizView()
        
        return view
    }()
    
    private lazy var viewModel: QuizViewModel = {
        let viewModel = QuizViewModel()
        
        return viewModel
    }()
    private let disposedBag = DisposeBag()
    private var seconds = 10
    private var timer = Timer()
    
    override func loadView() {
        self.view = viewScreen
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.delegate = self
        hiddenButtons()
        hiddenTime()
        viewModel.characters.removeAll()
        resetTimeResults()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        getNewQuiz()
        setupButtonObservers()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupButtonObservers() {
        for (index, button) in viewScreen.buttonArray.enumerated() {
            button.rx.tap
                .subscribe(onNext: { [weak self] in
                    self?.buttonTapped(index: index, title: button.textLabel.text)
                })
                .disposed(by: disposedBag)
        }
    }
    
    private func buttonTapped(index: Int, title: String?) {
        if let title = title {
            viewModel.validadeAnswer(name: title)
            hiddenButtons()
            getNewQuiz()
        }
    }
    
    private func resetTimeResults() {
        seconds = 10
        viewModel.resetTotalanswers()
    }
    
    private func hiddenTime() {
        viewScreen.timeLabel.isHidden = true
    }
    private func hiddenButtons() {
        viewScreen.stackView.isHidden = true
        viewScreen.personImage.isHidden = true
    }
    
    private func showButtons() {
        viewScreen.stackView.isHidden = false
        viewScreen.timeLabel.isHidden = false
        viewScreen.personImage.isHidden = false
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        viewScreen.timeLabel.text = String(seconds)
        
        if seconds <= 0 {
            hiddenButtons()
        }
        
        if seconds <= -1 {
            timer.invalidate()
            showResults()
        }
    }
    
    private func getNewQuiz() {
        self.viewModel.loadHeros()
        
    }
    
    private func configureScreen(heroe: Hero) {
        guard let quiz = viewModel.quiz else { return }
        
        if let url = URL(string: heroe.thumbnail.url) {
            viewScreen.personImage.kf.indicatorType = .activity
            viewScreen.personImage.kf.setImage(with: url)
        } else {
            viewScreen.personImage.image = nil
        }
        for i in 0..<quiz.options.count {
            let nameOption = quiz.options[i]
            let button = viewScreen.buttonArray[i]
            button.setupTextButton(text: nameOption)
        }
    }
    
    private func showResults() {
        let resultViewcontroller = ResultViewController()
        resultViewcontroller.totalAnswers = viewModel.totalAnswers
        resultViewcontroller.totalCorrectAnswers = viewModel.totalCorrectAnswers
        resultViewcontroller.chars = viewModel.characters
        self.navigationController?.pushViewController(resultViewcontroller, animated: true)
    }
}

extension QuizViewController: QuizViewModelProtocol {
    func success(heroe: Hero) {
        self.configureScreen(heroe: heroe)
        self.showButtons()
    }
    
    func failure() {
        Alert.showBasicAlert(title: "ERRO", message: "Erro ao carregar personagem", viewController: self)
    }
}

