//
//  ViewController.swift
//  NearbyLocations
//
//  Created by Varun Shenoy on 7/15/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchText: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let padding = UIView(frame: CGRectMake(0, 0, 8, self.searchText.frame.height))
        searchText.leftView = padding
        searchText.leftViewMode = UITextFieldViewMode.Always
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        let locationVC = segue.destinationViewController as! LocationVC
        
        locationVC.searchTerm = searchText.text!
    }
}

