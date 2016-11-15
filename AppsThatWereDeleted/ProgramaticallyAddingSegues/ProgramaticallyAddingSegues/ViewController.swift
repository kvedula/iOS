//
//  ViewController.swift
//  ProgramaticallyAddingSegues
//
//  Created by Kamesh Vedula on 7/6/16.
//  Copyright © 2016 TechLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scanButton (sender: UIButton!) {
        
        performSegueWithIdentifier("newNote", sender: self)
        
    }


}

