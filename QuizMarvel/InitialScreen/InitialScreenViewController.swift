//
//  ViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import RxSwift

class InitialScreenViewController: UIViewController {
    
    private lazy var viewScreen: InitialScreen = {
        viewScreen = InitialScreen()
        
        return viewScreen
    }()
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.startButton.rx.tap.bind {
            self.navigationController?.pushViewController(QuizViewController(), animated: true)
        }.disposed(by: disposeBag)
    }


}

