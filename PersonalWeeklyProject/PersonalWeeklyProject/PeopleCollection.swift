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
//    profileFetchRequest.sortDescriptors = [sortDescriptor]

    
    func appendNewProfile(name: String) {
        
        // creates a new profile with no mediums
        let newProfile = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: self.managedObjectContext) as! Entity
        newProfile.name = name
        newProfile.mediums = []
        newProfile.dateAdded = NSDate()
    }
    
    func appendingProfileDetails(medium: String, indexPathOfProfile: NSIndexPath) {
        
        // goes to specific profile and append a medium attached to that profile
        self.profileFetchRequest.sortDescriptors = [self.sortDescriptor]
        
        let profileToChange = self.managedObjectContext.executeFetchRequest(self.profileFetchRequest, error: nil) as! [Entity]
        profileToChange[indexPathOfProfile.row].mediums.append(medium)
    }
    
    func deleteProfile(indexPathofProfile: NSIndexPath) {

        // goes to specific profile and delete the lot
        self.profileFetchRequest.sortDescriptors = [self.sortDescriptor]
        let profileToDelete = self.managedObjectContext.executeFetchRequest(self.profileFetchRequest, error: nil) as! [Entity]
        
        self.managedObjectContext.deleteObject(profileToDelete[indexPathofProfile.row])
    }
    
    
    func deleteMediumofProfile(indexPathOfProfile: NSIndexPath, indexPathOfMedium: NSIndexPath) {
    
        //goes to the specific profile, then to delete specific medium of that profile
        self.profileFetchRequest.sortDescriptors = [self.sortDescriptor]
        let profileToChange = self.managedObjectContext.executeFetchRequest(self.profileFetchRequest, error: nil) as! [Entity]
        
        profileToChange[indexPathOfProfile.row].mediums.removeAtIndex(indexPathOfMedium.row)
    }
    
}