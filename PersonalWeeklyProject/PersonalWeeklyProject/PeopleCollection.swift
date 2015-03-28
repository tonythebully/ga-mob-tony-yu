//
//  PeopleCollection.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 24/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import Foundation

class PeopleCollection {
    var peopleArray : [Dictionary<String, AnyObject>] = [
        [
            "name" : "add a new contact!",
            "info" : ["Where would you stalk them?", "Perhaps youtube links, home address, etc"]
        ]
    ]
    
    // appends a new dictionary with new contact to peopleArray
    func addNewContact(name : String) {
        let newPersonDict : Dictionary<String, AnyObject> = [
            "name" : name,
            // leaving the info empty as it will be appending at another stage
            "info" : [""]
        ]
        self.peopleArray.append(newPersonDict)
    }
    // changes the info related to the current person via indexPath
    func editPersonInfo (info : [String], indexPath : NSIndexPath) {
        self.peopleArray[indexPath.row]["info"] = info
    }
}