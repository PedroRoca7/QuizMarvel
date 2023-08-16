//
//  ViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    private lazy var viewScreen: InitialScreen = {
        viewScreen = InitialScreen()
        
        return viewScreen
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

