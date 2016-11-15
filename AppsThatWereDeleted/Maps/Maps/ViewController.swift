//
//  ViewController.swift
//  Maps
//
//  Created by Kamesh Vedula on 7/7/16.
//  Copyright © 2016 Kammu Inc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{

    //Longitude: 37.2884721
    //Latitude: -122.0342995
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let initialLocation = CLLocation(latitude: 37.2884721, longitude: -122.0342995)
    
    var annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ask for permission to get the location data
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        
        //show the users current location
        mapView.showsUserLocation = true
        mapView.delegate = self
       
        
        //centerMapOnLocation(initialLocation)
        
        let location = CLLocationCoordinate2D(latitude: 37.2884721, longitude: -122.0342995)
        
        annotation.coordinate = location
        annotation.title = "TechLab"
        annotation.subtitle = "Saratoga"
        
        mapView.addAnnotation(annotation)
    }
    
    
//    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
//        let region = MKCoordinateRegion(center: self.mapView.userLocation.coordinate,
//                                        span: MKCoordinateSpanMake(0.1, 0.1))
//        mapView.setRegion(region, animated: true)
//    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }


}

