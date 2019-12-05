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
    
    // Camera //
    @IBOutlet weak var Camera: UIButton!
    
    // Map /
    @IBOutlet weak var map_view: MKMapView!
    
    // Connect Pin Button Tomorrow//
    @IBOutlet weak var drop_pint: UIButton!
    
    
    // countdown seconds
    var countdown = 30
    var timer = Timer()
    
    var locationManager = CLLocationManager()
    
    // dirty hack for now
    var current_longtitude : Double?
    var current_latitude : Double?

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
            
            //Model.I.newTrip(name: "Trip 1") // Sample Interactions with the database
                   //Model.I.newPin(img: <#T##UIImage#>, msg: "hello!!!")
                   // Upon delegate actions we need to take picture and invoke
                   // Model.I.newPin(img: <#T##UIImage#>, msg: <#T##String#>)
            
            
            
        } else {
            print("Please turn on location services or GPS")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwind_to_start_tracker(_ sender: UIStoryboardSegue){}
    @IBAction func Camera(_ sender: UIButton){
        let longitute = current_longtitude
        performSegue(withIdentifier: "datapass", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! CameraLogic
        vc.longitude_ = self.current_longtitude
        
    }
    
}

extension Start_Tracking:  CLLocationManagerDelegate {

    //  Created by Aman Aggarwal on 03/03/18.
    //  Copyright © 2018 Aman Aggarwal. All rights reserved.
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
    
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        self.map_view.setRegion(region, animated: true)
        
        // Sets global declared variables to location distances
        if let location = locations.first{
            current_latitude? = location.coordinate.latitude
            current_longtitude? = location.coordinate.longitude
        }
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
    
   
}
