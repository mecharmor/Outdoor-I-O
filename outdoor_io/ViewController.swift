//
//  ViewController.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Buttons and its definitions
    @IBOutlet weak var start_tracking: UIButton!
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var settings: UIButton!
    
    /*1. --- button settings*/
    func button_settings() {
        // button view definitions
        // .clipsToBounds are meant for images
        start_tracking.layer.cornerRadius = 8.0
        start_tracking.clipsToBounds = true
        history.layer.cornerRadius = 8.0
        history.clipsToBounds = true
        settings.layer.cornerRadius = 8.0
        settings.clipsToBounds = true
    }
    
    /*2. --- backdrop settings*/
    func screen_backdrop() {
        // Set BackGround color for screens
        
        view.backgroundColor = UIColor.init(red: 46/255, green: 64/255, blue: 56/255, alpha: 0.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.I.newTrip(name: "Trip 1") // Sample Interactions with the database
        //Model.I.newPin(img: <#T##UIImage#>, msg: "hello!!!")
        // Upon delegate actions we need to take picture and invoke
        // Model.I.newPin(img: <#T##UIImage#>, msg: <#T##String#>)
        
        
        // #1
        screen_backdrop()
        
        // #2
        button_settings()
        
        // Sample Data Creation
        // Created by Cory Lewis
        //Model.I.newTrip(name: "Trip 1")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind_to_main(_ sender: UIStoryboardSegue){}
}
