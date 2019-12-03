//
//  permission.swift
//  outdoor_io
//
//  Created by RCMACEXT-57 on 11/26/19.
//  Copyright © 2019 SCMACEXT-00. All rights reserved.
//

import Foundation
import CoreLocation

class permission: UIViewController, CLLocationManagerDelegate {
    
    
    // location declaration //
    let locationManager = CLLocationManager()
    
    // --- Location setup --- //
    func setupLocationManager(){
        //locationManager.delegate = self
        //allows for highest accuracy mode
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
        }
        else{
            
        }
    }
}

extension Start_Tracking: CLLocationManagerDelegate{
    
    func location_manager(_ manager: CLLocation, didUpdateLocations locations: [CLLocation]){
        
    }
    
    func locationManager(_ manager: CLLocation, didChangeAuthorization status: CLAuthorizationStatus){
        
        
    }
    
}
