//
//  Model.swift
//  OutdoorIO
//
//  Created by Cory Lewis on 11/23/19.
//  Copyright © 2019 CR. All rights reserved.
//

import UIKit
import Foundation
import EasyStash // https://github.com/onmyway133/EasyStash

struct Pin: Decodable, Encodable{
    var long: Double!
    var lat: Double!
    var img: String!
    var msg: String!
    var thumb: String!
    
    init(long:Double, lat:Double, img: UIImage, msg: String) {
        self.long = long
        self.lat = lat
        self.img = self.convertImageToBase64(image: img)
        self.thumb = self.convertImageToBase64(image: self.createThumbnail(image: img)) // create thumbnail then serialize into base 64
        self.msg = msg
    }
    
    func convertImageToBase64(image: UIImage) -> String { // Convert UIImage to a base64 representation
       let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
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
struct Trip: Decodable, Encodable{
    let name: String
    var pins: [Pin]? //Array of Pins
    
    init(name: String) {
        self.name = name
    }
    mutating func addPin(pin: Pin){
        pins?.append(pin)
    }
}

final class Model{
    var storage : Storage
    private init(){
        var options = Options()
        options.folder = "OutdoorIO"
        self.storage = try! Storage(options: options)
    }
    
    static var I = Model() //Singleton
    var currentTrip:Trip? = nil
    let keyToTrips = "TRIP"
    
    // Add trip that stores all the pins
    func addTrip(name: String){
        guard let trip = self.currentTrip else {
            self.currentTrip = Trip(name: name) // first trip
            return
        }
        self.save(trip: trip) // save previous trip
        self.currentTrip = Trip(name: name)
    }
    
    // Save a Trip
    func save(trip: Trip){
        do{
            try self.storage.save(object: trip, forKey: self.keyToTrips)
        } catch {
            print("[Model.swift], saveTrip failed")
        }
    }
    
    // Helper Methods
    func convertBase64ToImage(imageString: String) -> UIImage { // Convert a base64 representation to a UIImage
         let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
         return UIImage(data: imageData)!
     }
}

//
//var options = Options()
//       options.folder = "Trip"
//       var storage = try! Storage(options: options)
//
//       let dict = {key1: "value1", key2: "value2"}
//       let list = [dict]
//
//       try storage.save
//
//       try storage.save(list, forKey: "user")
//       try storage.save(cities, forKey: "cities")
//
//       let loadedUser = try storage.load(forKey: "user", as: User.self)
//       let loadedCities = try storage.load(forKey: "cities", as: [City].self)
