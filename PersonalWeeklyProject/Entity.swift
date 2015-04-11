//
//  Entity.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 11/04/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import Foundation
import CoreData

class Entity: NSManagedObject {

    @NSManaged var friends: Dictionary<String, AnyObject>

}
