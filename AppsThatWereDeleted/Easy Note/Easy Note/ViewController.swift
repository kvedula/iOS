//
//  ViewController.swift
//  Easy Note
//
//  Created by Kamesh Vedula on 7/13/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

var notes:[Note] = []

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = notes[indexPath.row]
        
        cell.textLabel!.text = note.text
        
        return cell
    }
    
    
    
    
    //Changing status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }

}

