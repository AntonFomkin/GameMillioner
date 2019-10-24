//
//  GameViewController.swift
//  Millioner
//
//  Created by Anton Fomkin on 09/10/2019.
//  Copyright © 2019 Anton Fomkin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var textQuestion: UILabel!
    var delegate : GameResultDelegate?
    var numberQuestion = 1
    var countTrueAnswer : Int = 0
    var gameOver: Bool = false
    let currentSession = Question()
    var buttons : [UIButton] = []
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "",
                                         style: .plain,
                                         target: navigationController,
                                         action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        Game.shared.countQuestion = currentSession.question.count
        
        countTrueAnswer = 0
        gameOver = false
        
        self.delegate = GameSession()
        startGameScreen()
    }
    
    func startGameScreen() {
       
        buttons.append(btn1)
        buttons.append(btn2)
        buttons.append(btn3)
        buttons.append(btn4)
      
        getNewQuestion(numberOfQuestion: numberQuestion)
        buttonTarget(isTarget: true)
    }
    
    func getNewQuestion(numberOfQuestion: Int) {
        textQuestion.text = "Вопрос #\(numberQuestion)\n" + currentSession.question[numberQuestion]!
        for (index,_) in buttons.enumerated() {
            buttons[index].setTitle(currentSession.response[numberQuestion]?[index], for: .normal)
            buttons[index].setTitleColor(UIColor.white, for: .normal)
        }
    }
 
    func buttonTarget(isTarget: Bool) {
        for (index,_) in buttons.enumerated() {
            if isTarget {
                buttons[index].addTarget(self, action: #selector(answer(_:)), for: .touchUpInside)
            } else {
                buttons[index].removeTarget(self, action: #selector(answer(_:)), for: .touchUpInside)
            }
            buttons[index].tag = index + 1
            
        }
    }
    
    @objc func answer(_ sender: UIButton) {
        
        let dispatchGroup = DispatchGroup()
     
        DispatchQueue.main.async(group: dispatchGroup) {

            if self.currentSession.trueQuestion[self.numberQuestion] == sender.tag {
                sender.setTitleColor(UIColor.green, for: .normal)
                self.countTrueAnswer += 1
            } else {
                sender.setTitleColor(UIColor.red, for: .normal)
                self.gameOver = true
            }
        
            self.numberQuestion += 1
        }
            dispatchGroup.notify(queue: DispatchQueue.main) {
             sleep(1)
                if (self.numberQuestion - 1 < self.currentSession.question.count) && (self.gameOver != true) {
                    self.getNewQuestion(numberOfQuestion: self.numberQuestion)
                } else {
                    self.buttonTarget(isTarget: false)
                    self.delegate?.eventEndGame(result: self.countTrueAnswer)
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
    }
    
}
