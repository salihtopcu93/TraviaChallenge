//
//  ViewController.swift
//  Trivia Challange
//
//  Created by salih topcu on 8.04.2019.
//  Copyright © 2019 salih topcu. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var viewModel: TraviaChallangeViewModel!

  // MARK: - init

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureModel()
    }
    
    func configureModel() {
        self.viewModel = TraviaChallangeViewModel.init()
        self.viewModel.delegate = self as? TraviaChallangeViewDelegate
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTriviaChallenge { (result) in
            print(result)
        }
        }
    }
    
    

