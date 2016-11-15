//
//  ViewController.swift
//  Notes
//
//  Created by Kamesh Vedula on 7/13/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var notes:[Note] = []
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = notes[indexPath.row]
        
        cell.textLabel!.text = note.text
        
        return cell
    }
    
    
    
    //Changing status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }


}

