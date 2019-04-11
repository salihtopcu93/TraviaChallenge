//
//  WinnersViewController.swift
//  Trivia Challange
//
//  Created by salih topcu on 11.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import UIKit

class WinnersViewController: UIViewController {

    var viewModel : WinnersViewModel!
    
    
    func configureModel() {
        self.viewModel = WinnersViewModel.init()
        self.viewModel.delegate = self as! WinnersViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureModel()

    }
    

}
