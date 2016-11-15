//
//  RestaurantTableViewController.swift
//  BayFood
//
//  Created by Kamesh Vedula on 7/6/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    var restaurantNames = ["Starbucks", "Verde", "Tpumps", "Cafe Lattea", "Philz Coffee",
                           "Pekoe", "Icebox", "Cream", "Jamba Juice",
                           "Peet's Coffee", "Tea Top", "Tea Zone",
                           "Krispy Kreme", "Five Guys", "Boba Bar"]
    
    var restaurantImages = ["starbucks.jpg", "verde.jpg", "tpumps.jpg", "cafelattea.jpg", "philz.jpg", "pekoe.jpg",
                            "icebox.jpg", "cream.jpg", "jambajuice.jpg", "peets.jpg", "teatop.jpg",
                            "teazone.jpg", "krispykreme.jpg", "fiveguys.jpg", "bobabar.jpg"]
    
    var restaurantLocations = ["Cupertino", "Santa Clara", "Cupertino", "Cupertino", "Cupertino", "Evergreen",
                               "Cupertino", "Cupertino", "Saratoga", "Saratoga", "Cupertino",
                               "Campbell", "Mountain View", "Saratoga", "San Jose"]
    
    var restaurantTypes = ["Coffee", "Boba", "Boba", "Boba", "Coffee", "Boba",
                           "Ice Cream Sandwiches", "Ice Cream Sandwiches", "Juice", "Coffee", "Boba",
                           "Boba", "Donuts", "Fast Food", "Boba"]
    
    var restaurantIsVisited = [Bool](count: 15, repeatedValue: false)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    
    //Action stuff.....
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        
//        let callActionHandler = {(action:UIAlertAction!) -> Void in
//            
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.",preferredStyle: .Alert)
//            
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)
//        
//        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
//            
//            (action:UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            cell?.accessoryType = .Checkmark
//            self.restaurantIsVisited[indexPath.row] = true
//        })
//        
//        optionMenu.addAction(isVisitedAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        
//        // Display the menu
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//        
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle
        editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath:
        NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            restaurantNames.removeAtIndex(indexPath.row)
            restaurantLocations.removeAtIndex(indexPath.row)
            restaurantTypes.removeAtIndex(indexPath.row)
            restaurantIsVisited.removeAtIndex(indexPath.row)
            restaurantImages.removeAtIndex(indexPath.row)
        }
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath
        indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.Default, title: "Share", handler: { (action,
                indexPath) -> Void in
                let defaultText = "Just checking in at " +
                    self.restaurantNames[indexPath.row]
                if let imageToShare = UIImage(named:
                    self.restaurantImages[indexPath.row]) {
                    let activityController = UIActivityViewController(activityItems:
                        [defaultText, imageToShare], applicationActivities: nil)
                    self.presentViewController(activityController, animated: true,
                        completion: nil)
                } })
        // Delete button
        let deleteAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.Default, title: "Delete",handler: { (action,
                indexPath) -> Void in
                // Delete the row from the data source
                self.restaurantNames.removeAtIndex(indexPath.row)
                self.restaurantLocations.removeAtIndex(indexPath.row)
                self.restaurantTypes.removeAtIndex(indexPath.row)
                self.restaurantIsVisited.removeAtIndex(indexPath.row)
                self.restaurantImages.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:
                    .Fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0,
                                              blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                destinationController.restaurantImage = restaurantImages[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantLocation = restaurantLocations[indexPath.row]
                destinationController.restaurantType = restaurantTypes[indexPath.row]
            }
        }
    }
    
    
}
