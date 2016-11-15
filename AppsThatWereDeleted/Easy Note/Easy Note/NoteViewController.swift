//
//  NoteViewController.swift
//  Easy Note
//
//  Created by Kamesh Vedula on 7/13/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var textFieldNote: UITextField!
    @IBOutlet weak var addNoteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tap outside of the keyboard to close it
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func addNote(sender: AnyObject) {
        if(textFieldNote.text != ""){
            notes.append(Note(text: textFieldNote.text!))
        }
        textFieldNote.text = " "
    }
    
    //Changing status Bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
