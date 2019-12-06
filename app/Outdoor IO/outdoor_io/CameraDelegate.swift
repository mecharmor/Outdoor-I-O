//
//  CameraDelegate.swift
//  outdoor_io
//
//  Created by DMSIMAC07 on 12/3/19.
//  Copyright © 2019 SCMACEXT-00. All rights reserved.
//  video: https://www.youtube.com/watch?v=7TqXrMnfJy8

import Foundation
import UIKit
import AVFoundation

class CameraDelegate: UIViewController{
    
    // Back Button //
    @IBOutlet weak var Back: UIButton!
  
    @IBOutlet weak var label: UILabel!
    
    var captureSession = AVCaptureSession()
    var front_camera = AVCaptureDevice?()
    var back_camera = AVCaptureDevice?()
    var current_camera = AVCaptureDevice?()
    var photoOutput: AVCapturePhotoOutput?
    
    // --- Viewer --- //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view configurations
        screen_backdrop()
        button_settings()
        
        // camera
        setupCameraSession()
        setupDevice()
        setupInputOutput()
        
        startRunningCaptureSession()
        
        
    }

    func setupCameraSession(){
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes:[AVCaptureDevice.DeviceType.builtInDualCamera], mediatype: AVMediaType.video)
        let devices = deviceDiscoverySession.devices
        
        for device in devices{
            if device.position == AVCaptureDevice.Postion.back{
                back_camera = device
            }
            else if device.position == AVCaptureDevice.Position.front{
                front_camera = device
            }
        }
        current_camera = back_camera
    }
    
    func setupInputOutput(){
        do{
            let captureDeviceInput = try AVCaptureDeviceInput(device: current_camera)
            captureSession.addInput(captureDeviceInput)
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format:[AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
        }
        catch{
            print(error)
        }
    }
}

extension CameraDelegate{
    
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
    
    
}

