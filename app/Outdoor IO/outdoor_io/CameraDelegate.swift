//
//  ViewController.swift
//  AV Foundation
//
//  Created by Pranjal Satija on 5/22/17.
//  Copyright © 2017 Pranjal Satija. All rights reserved.
//  https://www.appcoda.com/avfoundation-swift-guide/

import UIKit
import DKCamera

class CameraDelegate: UIViewController {
    
    let camera: DKCamera = DKCamera()

    @IBOutlet var cam_view: UIView!
    @IBOutlet weak var cameraViewText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let camView = self.camera.cameraOverlayView else {
            self.cam_view = UIView()
            print("No Camera Detected!")
            return
        }
        self.cameraViewText.isHidden = true
        self.cam_view = camView
    }
    
//    @IBAction func back_pressed(_ sender: Any) {
//        self.camera.didCancel = {
//            print("Camera canceled")
//        }
//    }
    @IBAction func cam_pressed(_ sender: Any) {
        print("Take Picture Pressed!")
        self.camera.didFinishCapturingImage = { (image: UIImage?, metadata: [AnyHashable : Any]?) in
            print("go to next screen here and save coorindates")
            
            guard let img = image else{
                print("No Image taken!")
                return
            }
            
            if Model.I.newPin(img: img) {
                print("Successfully saved pin!")
            }else {
                print("Failed to save pin!")
            }
        }
        
    }
    
}

