//
//  HomeViewController.swift
//  Spot
//
//  Created by ARUNDAS PS on 2019-11-27.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
   
    
    @IBOutlet weak var MKMapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       // print(locations)
        
        let userLocations : CLLocation = locations[0]
        
        let latitute = userLocations.coordinate.latitude
        let longitute = userLocations.coordinate.longitude
        let latDelta : CLLocationDegrees = 0.05
        let lonDelta : CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location = CLLocationCoordinate2D(latitude: latitute, longitude: longitute)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.MKMapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Current Location"
        annotation.subtitle = ""
        annotation.coordinate = location
        
        self.MKMapView.addAnnotation(annotation)
        
        
        
        
        
    }

}
