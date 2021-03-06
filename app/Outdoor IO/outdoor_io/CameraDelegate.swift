//
//  ViewController.swift
//  AV Foundation
//
//  Created by Pranjal Satija on 5/22/17.
//  Copyright © 2017 Pranjal Satija. All rights reserved.
//  https://www.appcoda.com/avfoundation-swift-guide/

import UIKit
import SwiftyCam

class CameraDelegate: SwiftyCamViewController, SwiftyCamViewControllerDelegate {
    
    @IBOutlet weak var cameraButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraDelegate = self
        tapToFocus = true
        pinchToZoom = true
        maxZoomScale = 2.0
        shouldUseDeviceOrientation = true
        doubleTapCameraSwitch = true
        defaultCamera = .rear
    }
    
//    @IBAction func back_pressed(_ sender: Any) {
//        self.camera.didCancel = {
//            print("Camera canceled")
//        }
//    }
    @IBAction func cam_pressed(_ sender: Any) {
        takePhoto()
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        
        print("attempted to take photo with SwiftyCam")
         // Called when takePhoto() is called or if a SwiftyCamButton initiates a tap gesture
         // Returns a UIImage captured from the current session
        if Model.I.newPin(img: photo) {
            print("Successfully saved pin!")
        }else {
            print("Failed to save pin!")
        }
    }
    
}

