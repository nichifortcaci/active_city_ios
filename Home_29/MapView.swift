//
//  MapView.swift
//  active_city
//
//  Created by Eugen Dascal on 7/24/16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Map"
    
    map.delegate = self
    
    let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
    let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 45.612125, longitude: 22.948280)
    let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
    
    map.setRegion(theRegion, animated: true)
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
    
    self.map.showsUserLocation = true
    
    
    for annotation  in annatotionPoint {
    map.addAnnotation(annotation)
    }
    
    
}


func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
{
    let location = locations.last
    
    let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    self.map.setRegion(region, animated: true)
    
    self.locationManager.stopUpdatingLocation()
}

func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
{
    print("Error: " + error.localizedDescription)
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}
