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

        
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet var answersbutton: [UIButton]!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var loadingResultActivity: UIActivityIndicatorView!
    
    var seconds = 120
    var timer = Timer()
    let viewModel = QuizViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        timerSlider.isHidden = true
        timerSlider.tintColor = .green
        timeLabel.isHidden = true
    }
    private func hiddenButtons() {
        buttonsView.isHidden = true
        personImageView.isHidden = true
        loadingResultActivity.isHidden = false
    }
    
    private func showButtons() {
        buttonsView.isHidden = false
        timerSlider.isHidden = false
        timeLabel.isHidden = false
        personImageView.isHidden = false
        loadingResultActivity.isHidden = true
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        timeLabel.text = String(seconds)
        
        timerSlider.value = Float(seconds)
        if seconds <= 20 {
            timerSlider.tintColor = .red
        }
        
        if seconds <= 0 {
            hiddenButtons()
        }
        
        if seconds <= -1 {
            timer.invalidate()
            showResults()
        }
    }
    
   @IBAction private func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
    }
    
    private func getNewQuiz() {
        self.viewModel.loadHeros()
    }
    
    private func configureScreen(heroe: Hero) {
        guard let quiz = viewModel.quiz else { return }
        
        if let url = URL(string: heroe.thumbnail.url) {
            personImageView.kf.indicatorType = .activity
            personImageView.kf.setImage(with: url)
        } else {
            personImageView.image = nil
        }
        for i in 0..<quiz.options.count {
            let option = quiz.options[i]
            let button = answersbutton[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    private func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewcontroller = segue.destination as? ResultViewController{
            resultViewcontroller.totalAnswers = viewModel.totalAnswers
            resultViewcontroller.totalCorrectAnswers = viewModel.totalCorrectAnswers
            resultViewcontroller.chars = viewModel.characters
        }
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
        //Alert com mensagem erro ao carregar personagem.
        print("Alert com mensagem erro ao carregar personagem.")
    }
    
    
}

