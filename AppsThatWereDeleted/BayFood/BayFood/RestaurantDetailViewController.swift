//
//  RestaurantDetailViewController.swift
//  BayFood
//
//  Created by Kamesh Vedula on 7/7/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameView: UILabel!
    @IBOutlet weak var restaurantLocationView: UILabel!
    @IBOutlet weak var restaurantTypeView: UILabel!
    
    var restaurantImage = ""
    var restaurantName = ""
    var restaurantLocation = ""
    var restaurantType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurantImage)
        restaurantNameView.text = restaurantName
        restaurantLocationView.text = restaurantLocation
        restaurantTypeView.text = restaurantType
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
