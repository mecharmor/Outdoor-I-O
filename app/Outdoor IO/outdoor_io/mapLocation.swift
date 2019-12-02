//
//  mapLocation.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/26/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//
//  mapLocation.swift
//  Creates the gps location of the user
//  Asks and resolves gps location resolution authorization
//  https://www.youtube.com/watch?v=Z272SMC9zuQ
//  https://www.youtube.com/watch?v=WPpaAy73nJc

import UIKit
import CoreLocation

class mapLocation: UIViewController {
    
    let location_manager = CLLocationManager()
    
    // checks permission to use location services
    func check_permission() -> Bool{
        if CLLocationManager.locationServicesEnabled(){
            return true
        }
        else{
            return false
        }
    }
    
   
}
