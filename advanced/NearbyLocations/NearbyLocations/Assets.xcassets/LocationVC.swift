//
//  LocationVC.swift
//  NearbyLocations
//
//  Created by Varun Shenoy on 7/15/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

    var searchTerm = ""
    
    let locationManager = CLLocationManager()
    
    var userSearch = [MKPlacemark]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        }
        
        self.title = "Results for: \(searchTerm)"
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchTerm
        request.region = mapView.region

        
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { response, error in
            guard let response = response else {
                print("There was an error searching for: \(request.naturalLanguageQuery) error: \(error)")
                return
            }
            
            for item in response.mapItems {
                if let mi = item as? MKMapItem {
                    self.userSearch.append(mi.placemark)
                    let dropPin = MKPointAnnotation()
                    dropPin.coordinate = mi.placemark.coordinate
                    dropPin.title = "\(mi.name!)"
                    if let phone = mi.phoneNumber {
                        dropPin.subtitle = "\(phone)"
                    }
                    self.mapView.addAnnotation(dropPin)
                }
                
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        //LightContent
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
