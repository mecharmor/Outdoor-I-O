//
//  Start_Tracking.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//
//  Starts tracking the users location
//  Also ask for permissions from permissions.swift
//  [TODO]
//  Position
//  Pin

import UIKit
import MapKit
import CoreLocation

class Start_Tracking: UIViewController {

    // Button //
    @IBOutlet weak var Back: UIButton!
    
    // Map /
    @IBOutlet weak var map_view: MKMapView!
    
    // countdown seconds
    var countdown = 30
    var timer = Timer()
    
    let locationManager = CLLocationManager()
    
    // --- button settings --- //
    func button_settings() {
        // button view definitions
        Back.backgroundColor = UIColor.init(red: 46/255, green: 89/255, blue: 70/255, alpha: 1)
        Back.layer.cornerRadius = 5.0
        
    }
    
    //--- backdrop settings --- //
    func screen_backdrop() {
        view.backgroundColor = UIColor.init(red: 46/255, green: 64/255, blue: 56/255, alpha: 1)
    }
    
    // --- Viewer --- //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view configurations
        screen_backdrop()
        button_settings()
        
        // Map Configuration Creation //
        map_view.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
        } else {
            print("Please turn on location services or GPS")
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension Start_Tracking:  CLLocationManagerDelegate {

    //  Created by Aman Aggarwal on 03/03/18.
    //  Copyright © 2018 Aman Aggarwal. All rights reserved.
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        self.map_view.setRegion(region, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
    
    func coundown_timer(){
        
    }
}







