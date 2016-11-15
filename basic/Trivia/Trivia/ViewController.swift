//
//  ViewController.swift
//  Trivia
//
//  Created by Varun Shenoy on 7/12/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var choiceA: UIButton!
    
    @IBOutlet weak var choiceB: UIButton!
    
    @IBOutlet weak var choiceC: UIButton!
    
    @IBOutlet weak var choiceD: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var currentQuestion = 0
    let questionSet: [String: [String]] = [
        "What video game console did Apple debut in  1996?": ["Pippin", "Gamecube", "Virtualboy", "Shockwave"],
        "Which Apple executive is responsible for the iPhone's trademarked chamfered edges?": ["Craig Federighi", "Eddie Cue", "Sir Jonathan Ive", "Steve Wozniak"],
        "Who is the current CEO of Apple?": ["Jeff Bezos", "Larry Ellison", "Marissa Mayer", "Tim Cook"],
        "The very first Apple logo featured which prominent figure?": ["Michael Faraday", "Nikola Tesla", "Sir Isaac Newton", "Richard Feynman"],
        "When was Apple founded?": ["January 30th, 1972", "April 1st, 1976", "July 31st, 1992", "July 30th, 1990"]
    
    ]
    
    let currentAnswers = ["Pippin", "Sir Jonathan Ive", "Tim Cook", "Sir Isaac Newton", "April 1st, 1976"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextQuestion(currentQuestion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choseA(sender: AnyObject) {
        if currentAnswers[currentQuestion] == choiceA.titleLabel?.text {
            nextQuestion(currentQuestion)
            increaseIndex()

        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            //vibrates phone if user answers incorrectly
        }
    }
    
    @IBAction func choseB(sender: AnyObject) {
        if currentAnswers[currentQuestion] == choiceB.titleLabel?.text {
            increaseIndex()
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            //vibrates phone if user answers incorrectly
        }
    }
    
    @IBAction func choseC(sender: AnyObject) {
        if currentAnswers[currentQuestion] == choiceC.titleLabel?.text {
            increaseIndex()
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            //vibrates phone if user answers incorrectly
        }
    }
    
    @IBAction func choseD(sender: AnyObject) {
        if currentAnswers[currentQuestion] == choiceD.titleLabel?.text {
            increaseIndex()
        } else {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            //vibrates phone if user answers incorrectly
        }
    }
    
    func nextQuestion(i: Int) {
        let question = Array(questionSet.keys)[i]
        print(question)
        print(i)
        print(currentAnswers[i])
        let answers = Array(questionSet.values)[i]
        questionLabel.text = question
        
        choiceA.setTitle(answers[0], forState: .Normal)
        choiceB.setTitle(answers[1], forState: .Normal)
        choiceC.setTitle(answers[2], forState: .Normal)
        choiceD.setTitle(answers[3], forState: .Normal)
    }
    
    func increaseIndex() {
        currentQuestion += 1
        if currentQuestion == 5 {
            UIView.animateWithDuration(0.3, animations: {
                self.playAgainButton.alpha = 1
            })
        } else {
            nextQuestion(currentQuestion)
        }
    }
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        currentQuestion = 0
        UIView.animateWithDuration(0.3, animations: {
            self.playAgainButton.alpha = 0
        })
        nextQuestion(currentQuestion)
    }
    

}

