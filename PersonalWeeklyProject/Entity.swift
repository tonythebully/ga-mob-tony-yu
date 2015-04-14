//
//  Entity.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 14/04/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import Foundation
import CoreData

class Entity: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var mediums: [String]

}
