//
//  ViewController.swift
//  GuessingGame
//
//  Created by Kamesh Vedula on 7/12/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var guessView: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessHelp: UILabel!
    
    var numberToGuess = Int(arc4random_uniform(100))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func guessButtonClicked(sender: AnyObject) {
        
        let userGuess = Int(guessTextField.text!)
    
        guessView.text = guessTextField.text
            
        if(userGuess > numberToGuess){
            guessHelp.text = "Your number is too high"
            
        } else if (userGuess < numberToGuess){
            guessHelp.text = "Your number is too low"
            
        } else {
            guessHelp.text = "CONGRATS! YOU GOT IT!"
            numberToGuess = Int(arc4random_uniform(100))
            
        }
        
        guessTextField.text = ""
        
        view.endEditing(true)
        
    }
    

    @IBAction func reset(sender: AnyObject) {
        numberToGuess = Int(arc4random_uniform(100))
    }

    
    //Changing Status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        //LightContent
        return UIStatusBarStyle.LightContent
        
        //Default
        //return UIStatusBarStyle.Default
        
    }
    

}

