//
//  PersistenceManager.swift
//  OutdoorIO
//
//  Created by Cory Lewis on 11/23/19.
//  Copyright © 2019 CR. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager{
    
    private init(){}
    static let I = PersistenceManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "OutdoorIO")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    lazy var context = persistentContainer.viewContext
     
    // fetch by using something like obj.fetch(Trip.self)
//    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
//        let entityName = String(describing: objectType)
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//        
//        do{
//            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
//            return fetchedObjects ?? [T]()
//            
//        } catch {
//            print(error)
//            return [T]()
//        }
//    }
    
//    func createTrip(){
//        let trip = Trip(context: self.context)
//        trip.name = "trip 1"
//        trip.timestamp = "test timestamp"
//        self.save()
//    }
    
    func save () {
        if context.hasChanges {
            do {
                try context.save()
                print("Saved Successfully!")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}
