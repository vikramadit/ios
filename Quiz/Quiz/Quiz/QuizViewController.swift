//
//  ViewController.swift
//  Quiz
//
//  Created by Vikram on 04/05/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions = ["What is 7 + 7?","What is the capital of Vermont?","What is the cognac made from?"]
    let answers = ["14", "Monpelier", "Grapes"]
    var currentQuestionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer =  answers[currentQuestionIndex]
        answerLabel.text = answer
    }
}

