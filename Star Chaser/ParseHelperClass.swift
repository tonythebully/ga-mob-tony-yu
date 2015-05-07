//
//  ParseHelperClass.swift
//  Star Chaser
//
//  Created by Tony Yu on 3/05/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import Parse

class parseHelperClass {
    
    func getProfiles() -> NSArray {
        var queryResults = []
    
        let getProfileQuery = PFQuery(className: "Profiles")
        getProfileQuery.fromLocalDatastore()
        getProfileQuery.findObjectsInBackgroundWithBlock() { objects, error in
            if let queryProfiles = objects {
                queryResults = queryProfiles
                
            }
        }
        return queryResults
    }
    
    func addProfile(firstName: String, lastName: String) {
        let profileObject = PFObject(className: "Profiles")
        profileObject["firstName"] = firstName
        profileObject["lastName"] = lastName
        profileObject.saveInBackground()
        profileObject.pin()
        
    }
    
    func removeProfile(objectId: String) {
//        let deleteProfileQuery = PFQuery(className: "Profiles")
//        deleteProfileQuery.whereKey("firstName", equalTo: firstName)
//        deleteProfileQuery.whereKey("lastName", equalTo: lastName)
//        deleteProfileQuery.findObjectsInBackgroundWithBlock() { objects, error in
//            if let objectToBeDeleted = objects {
//                let something: PFObject = objectToBeDeleted
//                something.deleteInBackground()
//            }
//        }
    }
    
    
    func getProfileMedias(firstName: String, lastName: String) -> NSArray{
        var queryResults = []
        
        let getProfileMediasQueury = PFQuery(className: "Profiles")
        getProfileMediasQueury.whereKey("firstName", equalTo: firstName)
        getProfileMediasQueury.whereKey("lastName", equalTo: lastName)
        getProfileMediasQueury.findObjectsInBackgroundWithBlock() { objects, error in
            if let queryMedias = objects {
                queryResults = queryMedias
            }
        }
        return queryResults
    }
    func addProfileMedia(mediaType: String, mediaHandle: String) {
        let profileMediaObject = PFObject(className: "ProfileMedias")
        profileMediaObject[mediaType] = mediaHandle
        profileMediaObject.saveInBackground()
    }
    
    func removeProfileMedia() {
        
    }
    
    
}
