//
//  ViewController.swift
//  TimeKeeper
//
//  Created by Varun Shenoy on 7/13/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    var timer = NSTimer()
    
    var currentTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.hidden = true
        resetButton.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        currentTime = 0.0
        timeLabel.text = "0.00"
        
        startButton.hidden = false
        pauseButton.hidden = true
        resetButton.hidden = true

    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        
        pauseButton.hidden = true
        resetButton.hidden = false
        startButton.hidden = false
    }
    
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
        pauseButton.hidden = false
        resetButton.hidden = false
        startButton.hidden = true

    }
    
    func updateTime() {
        
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 2
        
        currentTime += 0.01
        if currentTime < 1 {
            self.timeLabel.text = "0" + formatter.stringFromNumber(round(currentTime*100) / 100)!
        } else {
            self.timeLabel.text = formatter.stringFromNumber(round(currentTime*100) / 100)
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

}

