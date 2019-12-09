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

    // Back Button //
    @IBOutlet weak var Back: UIButton!
    
    // Camera Button //
    @IBOutlet weak var Camera: UIButton!


    // Map //
    @IBOutlet weak var map_view: MKMapView!
    
    // countdown seconds
    var countdown = 30
    var timer = Timer()
    
    let locationManager = CLLocationManager()
    
    // var for coordinates
    var long : CLLocationDegrees?
    var lat : CLLocationDegrees?
    
    
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
    
    func createTrip(){
        //code TODO
    }
    
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
//        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))

        self.present(alert, animated: true, completion: nil)
    }
    
    func promptForTrip() {
        showInputDialog(title: "Name Your Trip",
                        subtitle: "Please enter the name of your trip.",
                        actionTitle: "New",
                        inputPlaceholder: "Trip Name e.g Hike in Sierras",
                        inputKeyboardType: .default){ (input:String?) in
                            guard let name = input else {
                                self.promptForTrip()
                                return
                            }
                            if name != "" {
                                print("New Trip: \(name)")
                                Model.I.newTrip(name: name)
                                return
                            }
                            self.promptForTrip()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Model.I.isTripInProgress() == false {
            self.promptForTrip()
        }
        
//        guard let trips = Model.I.getAllTrips() else {
//            print("No Trips to retrieve")
//            return
//        }
//        for trip in trips {
//            guard let pins = trip.pins else {
//                continue
//            }
//            for pin in pins {
//                print("THUMBNAIL: \(pin.thumb!)")
//            }
//        }
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
            // Model.I.newPin(img: T##UIImage, msg: "hello!!!")
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
    
    @IBAction func unwind_to_start_tracking(_ sender: UIStoryboardSegue){}
    
//    @IBAction func Camera(_ sender: Any){
//        //let finalcoord = self.long
//        performSegue(withIdentifier: "datapass", sender: self)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        let vc = segue.destination as! CameraDelegate
//        vc.longtitude = "Hello!"
//        
//    }
    
}

extension Start_Tracking:  CLLocationManagerDelegate {

    //  Created by Aman Aggarwal on 03/03/18.
    //  Copyright © 2018 Aman Aggarwal. All rights reserved.
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //var local_value : CLLocationCoordinate2D = manager.location!.coordinate
    
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        
        self.map_view.setRegion(region, animated: true)
        
        locationManager.stopUpdatingLocation()
        
        //print current location via longitude and latitude
        if let location = locations.first{
            long = location.coordinate.longitude
            lat = location.coordinate.latitude
            
            //print("From func LocationManager", "\(long)", " ", "\(lat)")
            // print("From 'func locationManager' ", location.coordinate.latitude)
            // print("From 'func locationManager' ", location.coordinate.longitude)
            
            // let typecheck = type(of: location.coordinate.latitude)
            // print("location.coordinte.latitude is of type: '\(typecheck)'")
            // location.coordinate.latitude and longitude is of type "Double"
            
        }
        //print("Local Value", local_value)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
    
    
    
}
