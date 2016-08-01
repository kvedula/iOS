//
//  ViewController.swift
//  PennyPincher
//
//  Created by Varun Shenoy on 7/13/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var currentAmount: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextField!
    
    @IBOutlet weak var amountLabel: UITextField!
    
    @IBOutlet weak var transferSegmentedView: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var allTransactions = [transfer]()
    var currentMoney = 0.0
    
    let formatter = NSNumberFormatter()
    
    struct transfer {
        var amount: Double
        var deposit: Bool
        var descrip: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentAmount.text = "$0.00"
        tableView.delegate = self
        tableView.dataSource = self
        formatter.numberStyle = .CurrencyStyle
        
        let amountPadding = UIView(frame: CGRectMake(0, 0, 8, self.amountLabel.frame.height))
        amountLabel.leftView = amountPadding
        amountLabel.leftViewMode = UITextFieldViewMode.Always
        
        let descriptionPadding = UIView(frame: CGRectMake(0, 0, 8, self.descriptionLabel.frame.height))
        descriptionLabel.leftView = descriptionPadding
        descriptionLabel.leftViewMode = UITextFieldViewMode.Always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newTransfer(sender: AnyObject) {
        var isDeposit = true
        if transferSegmentedView.selectedSegmentIndex == 1 {
            isDeposit = false
        }
        if let amt = Double(amountLabel.text!) {
            let transaction = transfer(amount: amt, deposit: isDeposit, descrip: descriptionLabel.text!)
            allTransactions.append(transaction)
            if isDeposit {
                currentMoney += amt
            } else {
                currentMoney -= amt
            }
            currentAmount.text = formatter.stringFromNumber(currentMoney)
            descriptionLabel.text = ""
            amountLabel.text = ""
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        let trans = allTransactions[indexPath.row]
        
        let description = cell.viewWithTag(1) as! UILabel
        description.text = trans.descrip
        
        let expenditure = cell.viewWithTag(2) as! UILabel
        if trans.deposit {
            expenditure.text = "▴ \(formatter.stringFromNumber(trans.amount)!)"
        } else {
            expenditure.text = "▾ \(formatter.stringFromNumber(trans.amount)!)"
            expenditure.textColor = UIColor(red:0.84, green:0.28, blue:0.29, alpha:1.00)
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTransactions.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    @IBAction func segmentChanged(sender: AnyObject) {
        descriptionLabel.text = ""
        amountLabel.text = ""
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

