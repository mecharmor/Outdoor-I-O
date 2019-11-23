//
//  Pin+CoreDataProperties.swift
//  OutdoorIO
//
//  Created by Cory Lewis on 11/23/19.
//  Copyright © 2019 CR. All rights reserved.
//
//

import Foundation
import CoreData


extension Pin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pin> {
        return NSFetchRequest<Pin>(entityName: "Pin")
    }

    @NSManaged public var img: Data?
    @NSManaged public var latitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var msg: String?
    @NSManaged public var thumb: Data?
    @NSManaged public var timestamp: Date?
    @NSManaged public var trip: Trip?

}
