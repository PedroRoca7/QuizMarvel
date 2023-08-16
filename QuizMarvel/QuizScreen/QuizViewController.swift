//
//  QuizViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import Kingfisher
import SwiftUI

class QuizViewController: UIViewController {
    
    private lazy var viewScreen: QuizView = {
        let view = QuizView()
        
        return view
    }()
    
    private lazy var viewModel: QuizViewModel = {
        let viewModel = QuizViewModel()
        
        return viewModel
    }()
    
    var seconds = 120
    var timer = Timer()
    
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
    }

    private func resetTimeResults() {
        seconds = 120
        viewModel.resetTotalanswers()
    }
    
    private func hiddenTime() {
        viewScreen.timerSlider.isHidden = true
        viewScreen.timerSlider.tintColor = .green
        viewScreen.timeLabel.isHidden = true
    }
    private func hiddenButtons() {
        viewScreen.stackView.isHidden = true
        viewScreen.personImage.isHidden = true
    }
    
    private func showButtons() {
        viewScreen.stackView.isHidden = false
        viewScreen.timerSlider.isHidden = false
        viewScreen.timeLabel.isHidden = false
        viewScreen.personImage.isHidden = false
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        viewScreen.timeLabel.text = String(seconds)
        
        viewScreen.timerSlider.value = Float(seconds)
        if seconds <= 20 {
            viewScreen.timerSlider.tintColor = .red
        }
        
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
            let option = quiz.options[i]
            let button = viewScreen.buttonArray[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    private func showResults() {
        let resultViewcontroller = ResultViewController()
        resultViewcontroller.totalAnswers = viewModel.totalAnswers
        resultViewcontroller.totalCorrectAnswers = viewModel.totalCorrectAnswers
        resultViewcontroller.chars = viewModel.characters
        self.navigationController?.pushViewController(resultViewcontroller, animated: true)
    }
        
    @IBAction func selectAnswer(_ sender: UIButton) {
        if let buttonSelected = sender.currentTitle{
            viewModel.validadeAnswer(name: buttonSelected)
            hiddenButtons()
            getNewQuiz()
        }
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

