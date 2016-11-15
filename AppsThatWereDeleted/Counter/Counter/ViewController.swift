//
//  ViewController.swift
//  Counter
//
//  Created by Kamesh Vedula on 7/12/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UIButton!
    @IBOutlet weak var number: UILabel!
    
    var num = 0;
    var increment = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clickToCount(sender: AnyObject) {
        num += increment
        number.text = String(num)
    }
}

