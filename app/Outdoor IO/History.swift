//
//  History.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//

import UIKit

class History: UITableViewController {

    // let location_list = ["Socal", "Sacremento", "Montreal", "Monterey"]
    
    // Get all Trip data from Model
    // * Encased in brackets as Model.I.[func] returns an object
    var trip_name = [Model.I.getAllTrips]
    // Get all Pin data from Model
    // * getTripPins also returns an image within the return
    var pin_location = [Model.I.getTripPins]
        
    
    
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Screen + Button Setup
        screen_backdrop()
        button_settings()
        
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location_list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history_of_pins", for: indexPath)
        
        cell.textLabel?.text = location_list[indexPath.row]
        
        return cell
    }
    
}

extension History{
    
    // --- button settings --- //
    func button_settings() {
        // button view definitions
//        _back.backgroundColor = UIColor.init(red: 46/255, green: 89/255, blue: 70/255, alpha: 1)
//        _back.layer.cornerRadius = 5.0
//
    }
    
    //--- backdrop settings --- //
    func screen_backdrop() {
        view.backgroundColor = UIColor.init(red: 46/255, green: 64/255, blue: 56/255, alpha: 1)
    }
    
    
}
