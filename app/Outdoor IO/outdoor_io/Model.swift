import UIKit
import Foundation
import EasyStash // https://github.com/onmyway133/EasyStash

final class Model {
    /* Flow of the Class:
      - Follows Singleton design pattern. Class will initialize itself when I is access from Model.I
      - Initializer will create a folder on the iPhone and Trip is what dictates the current state
      - Adding a Trip will save the old one and create a new trip with given name
      - The Trip class holds an array of Pins (One) -> (Many) relationship
      - [TODO] implement cache */

    static var I = Model() //Singleton
    var trip:Trip? = nil
    let dataKey: String = "TRIPS"
    let storage: EasyStashWrapper

    private init(){
        self.storage = EasyStashWrapper(nameOfFolder: "OutdoorIO")
        // [issue], need to cache current trip in future (app crash)
    }

    func newTrip(name: String) {
        guard let _ = self.trip else {
            self.trip = Trip(name: name)
            return
        }
        self.storage.save(val: self.trip, key: self.dataKey)
        self.trip = Trip(name: name)
    }
    
    func isTripInProgress() -> Bool {
        guard let _ = self.trip else {
            return false
        }
        return true
    }

    func newPin(img: UIImage, msg: String = "") -> Bool {
        guard let coord = Shared.I.getCoordinates() else {
                     print("No Permissions Given to get Location!")
                     return false
        }
        
        let long: Double = coord.coordinate.longitude
        let lat: Double = coord.coordinate.latitude
        
        guard let _ = self.trip else {
            return false // no trip created yet
        }
        self.trip?.addPin(pin: Pin(long: long, lat: lat, img: img, msg: msg))
        return true
    }

    func getAllTrips() -> [Trip]? {
        return self.storage.load(key: self.dataKey)
    }

    func getTripPins() -> [Pin]? {
        guard let pins: [Pin] = self.trip?.pins else {
            return nil
        }
        return pins
    }

    func save() {
        guard let _ = self.trip else {
            return // Nothing to save
        }
        self.storage.save(val: self.trip, key: self.dataKey)
        self.trip = nil // reset
    }
}

class EasyStashWrapper {
    // Written By: Cory Lewis
    // Usage: Store/Retrieve Array of Generic Data
    // immutable and does not overwrite
    // Appends to current data and re-saves
    var storage : Storage

    init(nameOfFolder: String) {
        var options = Options()
        options.folder = nameOfFolder
        self.storage = try! Storage(options: options)
    }

    func save<T: Decodable & Encodable>(val: T, key: String) {
        DispatchQueue.global().async {
            do {
                if self.storage.exists(forKey: key) { // check if trips exist
                    var l: [T] = try self.storage.load(forKey: key, as: [T].self)
                    l.append(val)
                    try self.storage.save(object: l, forKey: key) // overwrite previous entry
                } else {
                    try self.storage.save(object: [val], forKey: key)
                }
            } catch {
                print("[Model.swift -> EasyStashWrapper], save failed horribly")
            }
        }
     }

    func load<T: Decodable & Encodable>(key: String) -> [T]? {
        do {
            if self.storage.exists(forKey: key) {
                return try storage.load(forKey: key, as: [T].self)
            }
        } catch {
            print("[Model.swift -> EasyStashWrapper], load failed horribly")
        }
        return nil
    }

    func getFiles() -> [File]? {
        do {
            return try storage.files()
        } catch {
            print("[Model.swift -> EasyStashWrapper], getFiles() failed horribly")
        }
        return nil
    }

    func clear() {
        do {
            try storage.removeAll()
        } catch {
            print("[Model.swift -> EasyStashWrapper], removeAll() failed horribly")
        }
    }
}

// Physical Schema for stored data

struct Trip: Decodable, Encodable{
    let name: String
    var pins: [Pin]? //Array of Pins

    init(name: String) {
        self.name = name
        self.pins = []
    }
    mutating func addPin(pin: Pin){
        pins?.append(pin)
    }
}

struct Pin: Decodable, Encodable{
    var long: Double!
    var lat: Double!
    var img: String!
    var msg: String!
    var thumb: String!

    init(long:Double, lat:Double, img: UIImage, msg: String) {
        self.long = long
        self.lat = lat
        self.img = Shared.I.convertImageToBase64(image: img)
        self.thumb = Shared.I.convertImageToBase64(image: Shared.I.createThumbnail(image: img)) // Scale to Thumb then base 64 it
        self.msg = msg
    }
    
    func getImg() -> UIImage {
        return Shared.I.convertBase64ToImage(imageString: self.img)
    }
    
    func getThumb() -> UIImage {
           return Shared.I.convertBase64ToImage(imageString: self.thumb)
       }
    
}
