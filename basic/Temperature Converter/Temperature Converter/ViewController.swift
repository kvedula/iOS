//
//  ViewController.swift
//  Temperature Converter
//
//  Created by Varun Shenoy on 7/1/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //instantiate iboutlets for ui elements
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    @IBOutlet weak var convertedTemp: UILabel!
    
    @IBOutlet weak var previousTemp: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tap outside of keyboard to close it
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    //convert temp on segmented view click
    @IBAction func convertTemp(sender: AnyObject) {
        convert()
    }
    
    //convert temp on button click
    @IBAction func convertButtonPressed(sender: AnyObject) {
        convert()
    }
    
     //convert temp
    func convert() {
        if let input = Double(textField.text!) {
            switch segmentedView.selectedSegmentIndex {
            case 0:
                let toCelcius = (input - 32) * (5/9)
                convertedTemp.text = "\(round(toCelcius * 1000)/1000)° C"
                previousTemp.text = "from \(round(input * 1000)/1000)° F"
            default:
                let toFahrenheit = (input * (9/5)) + 32
                convertedTemp.text = "\(round(toFahrenheit * 1000)/1000)° F"
                previousTemp.text = "from \(round(input * 1000)/1000)° C"
            }
        }

    }
    
    //Changing Status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        //LightContent
        return UIStatusBarStyle.lightContent
        
        
    }
    
    //TODO: Display an image to show how the weather is

}

