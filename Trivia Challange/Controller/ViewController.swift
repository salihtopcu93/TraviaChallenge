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
    var currentAnswerIndex: Int = 0
    var selectedAnswer: String = ""
    var jokerCount: Int = 0
    var currentButtonState: ButtonState = .trueAnswer
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModel()
    }
    
    // MARK: - Functions
    
    func configureModel() {
        self.viewModel = TraviaChallangeViewModel.init()
        self.viewModel.delegate = self
    }
    
    func configureView() {
        let initialQuestion = viewModel.result?.questions[self.currentQuestionIndex]
        self.questionLabel.text = initialQuestion?.question
        self.aButton.setTitle(initialQuestion?.a, for: .normal)
        self.bButton.setTitle(initialQuestion?.b, for: .normal)
        self.cButton.setTitle(initialQuestion?.c, for: .normal)
        self.dButton.setTitle(initialQuestion?.d, for: .normal)
        self.currentAnswer = initialQuestion?.correctAnswer ?? ""
        
        setCurrentAnswerIndex()
        
        aButton.backgroundColor = .clear
        bButton.backgroundColor = .clear
        cButton.backgroundColor = .clear
        dButton.backgroundColor = .clear
        
        questionView.isUserInteractionEnabled = true
        
        questionCountLabel.text = "\(currentQuestionIndex + 1) / 12"
    }
    
    func setCurrentAnswerIndex() {
        switch currentAnswer {
        case "a":
            self.currentAnswerIndex = 0
        case "b":
            self.currentAnswerIndex = 1
        case "c":
            self.currentAnswerIndex = 2
        case "d":
            self.currentAnswerIndex = 3
        default:
            break
        }
    }
    
    func checkAnswer(selectedButtonTag: Int) {
        if currentAnswerIndex == selectedButtonTag {
            currentQuestionIndex += 1
            
            setColor(buttonTag: selectedButtonTag, buttonState: .trueAnswer)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.configureView()
            }
        } else {
            setColor(buttonTag: selectedButtonTag, buttonState: .falseAnswer)
            setColor(buttonTag: currentAnswerIndex, buttonState: .trueAnswer)
            
            if self.jokerCount > 0 {
                showAlert(alertType: .joker)
            } else {
                showAlert(alertType: .elimination)
            }
        }
        
    }
    
    func setColor(buttonTag: Int, buttonState: ButtonState) {
        var currentColor: UIColor = .clear
        if buttonState == .trueAnswer {
            currentColor = .green
        } else {
            currentColor = .red
        }
        
        switch buttonTag {
        case 0:
            aButton.backgroundColor = currentColor
        case 1:
            bButton.backgroundColor = currentColor
        case 2:
            cButton.backgroundColor = currentColor
        case 3:
            dButton.backgroundColor = currentColor
        default:
            break
        }
    }
    
    func showAlert(alertType: AlertType) {
        let alertController = UIAlertController(title: alertType.title, message: alertType.message, preferredStyle: .alert)
        if alertType == .joker {
            alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
                self.showAlert(alertType: .elimination)
            }
            ))
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.jokerCount -= 1
                self.jokerCountLabel.text = "\(self.jokerCount)"
                self.currentQuestionIndex += 1
                self.configureView()
            }
            ))
        } else if alertType == .elimination {
             alertController.addAction(UIAlertAction(title: "TAMAM", style: .cancel, handler: nil))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonSelected(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            aButton.backgroundColor = UIColor.yellow
        case 1:
            bButton.backgroundColor = UIColor.yellow
        case 2:
            cButton.backgroundColor = UIColor.yellow
        case 3:
            dButton.backgroundColor = UIColor.yellow
        default:
            break
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.checkAnswer(selectedButtonTag: sender.tag)
        }
        questionView.isUserInteractionEnabled = false
    }
}

// MARK: - TraviaChallangeViewDelegate

extension ViewController: TraviaChallangeViewDelegate {
    func updatedList() {
        configureView()
        self.jokerCount = viewModel.result?.joker ?? 0
    }
}




