//
//  CameraLogic.swift
//  outdoor_io
//
//  Created by Cory Lewis on 12/4/19.
//  Copyright © 2019 SCMACEXT-00. All rights reserved.
//

import Foundation
import UIKit

// passing data into cameraclass

class CameraLogic: UIViewController{
    
    var longitude_: Double?
    var latitude_: Double?
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        label.text = "\(longitude_)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
