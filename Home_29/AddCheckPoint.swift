//
//  AddCheckPoint.swift
//  active_city
//
//  Created by Eugen Dascal on 7/23/16.
//  Copyright © 2016 Syrbu Konstantin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var checkPointArray = ["" : [CheckPoint]()]
var annatotionPoint = [MKPointAnnotation]()


var defaults = NSUserDefaults.standardUserDefaults()

class AddCheckPoint: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    let tmpKey = "tmpKey"
    
    let category = ["Voluntair", "Incidents", "Help now", "Util info", "Events", "Other"]
    var checkPoint = CheckPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*if let testArray = defaults.objectForKey(tmpKey) {
            checkPointArray = testArray as! [CheckPoint]
        }
 */

        picker.delegate = self
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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 0.2
        map.addGestureRecognizer(longPress)

    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        if titleField.text == "" || messageField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Firstly add title and message", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

        } else {
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        let newCoord:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        checkPoint.location.latitude = "\(newCoord.latitude)"
        checkPoint.location.longitude = "\(newCoord.longitude)"
        
        let newAnotation = MKPointAnnotation()
        newAnotation.coordinate = newCoord
        newAnotation.title = titleField.text != "" ? titleField.text : "Title"
        newAnotation.subtitle = messageField.text != "" ? messageField.text : "Meesage"
        map.addAnnotation(newAnotation)
        annatotionPoint.append(newAnotation)
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
    }
    
    @IBOutlet weak var map: MKMapView!

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return category[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        checkPoint.categoryId = row
    }
    

    @IBAction func addButton(sender: AnyObject) {
        
        if titleField.text == "" || messageField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Enter title and message", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
        
        if let title = titleField.text, message = messageField.text {
            
            self.checkPoint.title = title
            self.checkPoint.content = message
            //self.checkPoint.image = UIImage(named: "user")!
            
            checkPointArray[self.category[checkPoint.categoryId]] = [checkPoint]
            //defaults.setObject(checkPointArray, forKey: tmpKey)
            //defaults.synchronize()
            
            titleField.text = ""
            messageField.text = ""
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        print(checkPoint)
        }
    }
    
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    
}
