//
//  History.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//

import UIKit

class History: UIViewController {

    @IBOutlet weak var Back: UIButton!
    
    /*1. --- button settings*/
    func button_settings() {
        // button view definitions
        Back.backgroundColor = UIColor.init(red: 46/255, green: 89/255, blue: 70/255, alpha: 1)
        Back.layer.cornerRadius = 5.0
        
    }
    
    func screen_backdrop() {
        view.backgroundColor = UIColor.init(red: 46/255, green: 64/255, blue: 56/255, alpha: 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen_backdrop()
        button_settings()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
