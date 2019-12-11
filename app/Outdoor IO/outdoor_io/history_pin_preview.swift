//
//  History.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class history_pin_preview: UIViewController, UITableViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var image: UIImageView!
    
    var pin: Pin? = nil
    
    @IBOutlet weak var map: MKMapView!
    
//    let location_manager = CLLocationManager()
//
//    var long : CLLocationDegrees?
//    var lat : CLLocationDegrees?
    override func viewDidAppear(_ animated: Bool) {
        guard let img = self.pin?.getImg() else {
                   return
               }
        self.image?.image = img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map.showsUserLocation = true
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.pin?.lat ?? 0.1, longitude: self.pin?.long ?? 0.1), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
         self.map.setRegion(region, animated: true)
        
    }

    

}
