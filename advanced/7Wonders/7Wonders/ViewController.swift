//
//  ViewController.swift
//  7Wonders
//
//  Created by Varun Shenoy on 7/19/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        }
        imageView.image = UIImage(named: name!)
        let geocoder = CLGeocoder()
        self.title = name
        geocoder.geocodeAddressString(name!, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error)
            }
            if let placemark = placemarks?.first {
                self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                let span = MKCoordinateSpanMake(10, 10)
                let region = MKCoordinateRegion(center: (placemark.location?.coordinate)!, span: span)
                self.mapView.setRegion(region, animated: true)
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

