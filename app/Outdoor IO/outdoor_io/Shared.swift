//
//  Shared.swift
//  OutdoorIO
//
//  Created by Cory Lewis on 11/24/19.
//  Copyright © 2019 CR. All rights reserved.
//  Class `Shared` Follows the Singleton design pattern to help use helper methods throughout the program
import Foundation
import UIKit
import CoreLocation

final class Shared {
    var locationManager: CLLocationManager
    
    private init() {
        self.locationManager = CLLocationManager()
        self.locationManager.requestWhenInUseAuthorization()
    }
    static var I = Shared() //Singleton Design Pattern

    // Shared Helper Methods
    
    func getCoordinates() -> CLLocation? {
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            return self.locationManager.location
        }
        return nil
    }

    func convertImageToBase64(image: UIImage) -> String { // Convert UIImage to a base64 representation
        let imageData = UIImagePNGRepresentation(image)!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

    func convertBase64ToImage(imageString: String) -> UIImage { // Convert a base64 representation to a UIImage
         let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
         return UIImage(data: imageData)!
     }
    
    func createThumbnail(image: UIImage) -> UIImage {
        let newWidth: CGFloat = 100 // px to scale down to
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let thumb = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return thumb!
    }



}

// References
// https://stackoverflow.com/questions/11251340/convert-between-uiimage-and-base64-string
