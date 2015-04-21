//
//  PeopleCollection.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 24/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import CoreData

class PeopleCollection {
    var managedObjectContext: NSManagedObjectContext{
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        return appDelegate!.managedObjectContext!
    }
    
    let profileFetchRequest = NSFetchRequest(entityName: "Entity")
    let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: true)
    profileFetchRequest.sortDescriptors = [sortDescriptor]
    
    func appendNewProfile(name: String) {
        
        let newProfile = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: self.managedObjectContext) as! Entity
        newProfile.name = name
        newProfile.dateAdded = NSDate()
    }
    
    func appendingProfileDetails(medium: String, indexPathOfProfile: NSIndexPath) {
        
        let changes = self.managedObjectContext.executeFetchRequest(self.profileFetchRequest, error: nil) as! [Entity]
        changes[indexPathOfProfile.row].mediums.append(medium)
    }
    
    func deleteProfile(indexPathofProfile: NSIndexPath) {
        let profileToDelete = self.managedObjectContext.executeFetchRequest(self.profileFetchRequest, error: nil) as! [Entity]
        
        self.managedObjectContext.deleteObject(profileToDelete[indexPathofProfile.row])
    }
    func deleteMediumofProfile(indexPathOfProfile: NSIndexPath, indexPathOfMedium: NSIndexPath) {
        
    }
    
}