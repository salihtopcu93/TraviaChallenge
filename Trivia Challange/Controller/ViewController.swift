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
    
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var jokerCountLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var questionView: UIView!
    
    
    
    
    var viewModel: TraviaChallangeViewModel!
    var currentQuestionIndex = 0
    var currentAnswer: String = ""
    var selectedAnswer: String = ""

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
        
        configureInitialView()
    }
    
    func configureInitialView() {
        viewModel.getTriviaChallenge { (result) in
            let initialQuestion = result?.questions[self.currentQuestionIndex]
            self.questionLabel.text = initialQuestion?.question
            self.aButton.setTitle(initialQuestion?.a, for: .normal)
            self.bButton.setTitle(initialQuestion?.b, for: .normal)
            self.cButton.setTitle(initialQuestion?.c, for: .normal)
            self.dButton.setTitle(initialQuestion?.d, for: .normal)
            self.currentAnswer = initialQuestion?.correctAnswer ?? ""
        }
        aButton.backgroundColor = .clear
        bButton.backgroundColor = .clear
        cButton.backgroundColor = .clear
        dButton.backgroundColor = .clear
        questionView.isUserInteractionEnabled = true
        questionCountLabel.text = "\(currentQuestionIndex + 1) / 12"
    }
    
    func checkAnswer(selectedButtonTag: Int) {
        if currentAnswer == selectedAnswer {
            currentQuestionIndex += 1
            
            switch selectedButtonTag {
            case 0:
                aButton.backgroundColor = .green
            case 1:
                bButton.backgroundColor = .green
            case 2:
                cButton.backgroundColor = .green
            case 3:
                dButton.backgroundColor = .green
            default:
                break
            }
            print("doğru")
            configureInitialView()
        }
        else{
            print("yanlış cevap")
            switch selectedButtonTag {
            case 0:
                aButton.backgroundColor = .red
            case 1:
                bButton.backgroundColor = .red
            case 2:
                cButton.backgroundColor = .red
            case 3:
                dButton.backgroundColor = .red
            default:
                break
            }
            switch currentAnswer {
            case "a":
                aButton.backgroundColor = .green
            case "b":
                bButton.backgroundColor = .green
            case "c":
                cButton.backgroundColor = .green
            case "d":
                dButton.backgroundColor = .green
            default:
                break
            }
            }
        }
    
    
    @IBAction func aButtonSelected(_ sender: UIButton) {
        aButton.backgroundColor = UIColor.yellow
        selectedAnswer = "a"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.checkAnswer(selectedButtonTag: sender.tag)
        }
        questionView.isUserInteractionEnabled = false
    }
    
    
    
    
    
//    @IBAction func bButtonSelected(_ sender: UIButton) {
//        bButton.backgroundColor = UIColor.yellow
//         selectedAnswer = "b"
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.checkAnswer(selectedButtonTag: sender.tag)
//        }
//        questionView.isUserInteractionEnabled = false
//    }
//    @IBAction func cButtonSelected(_ sender: UIButton) {
//        cButton.backgroundColor = UIColor.yellow
//         selectedAnswer = "c"
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.checkAnswer(selectedButtonTag: sender.tag)
//        }
//        questionView.isUserInteractionEnabled = false
//    }
//    @IBAction func dButtonSelected(_ sender: UIButton) {
//        dButton.backgroundColor = UIColor.yellow
//         selectedAnswer = "d"
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.checkAnswer(selectedButtonTag: sender.tag)
//        }
//        questionView.isUserInteractionEnabled = false
//    }
    
    }
    
    

