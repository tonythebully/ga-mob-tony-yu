//
//  TableViewOfFriendList.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 21/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import CoreData

class FriendListTableView: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var appDelegate: AppDelegate?
    
    let peopleCollection = PeopleCollection()
    
    var fetchedResultsController : NSFetchedResultsController {
        
        // return the already created NSFetchedResultsController
        // if it has already been created
        // this is to stop the code from running multiple times
        if self._fetchedResultsController != nil {
            return self._fetchedResultsController!
        }
        
        // define the data we would like to retreive
        let fetchRequest = NSFetchRequest(entityName: "Entity")
        let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        self._fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.peopleCollection.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        self._fetchedResultsController?.delegate = self
        self._fetchedResultsController?.performFetch(nil)
        
        return self._fetchedResultsController!
    }
    var _fetchedResultsController : NSFetchedResultsController?

    var people : [Dictionary<String, AnyObject>] = [
        [
            "name" : "add a new contact!",
            "info" : ["Where would you stalk them?", "Perhaps youtube links, home address, etc"]
            
        ]
    ]

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        if self.fetchedResultsController.sections!.count > 0 {
            return self.fetchedResultsController.sections!.count
        }
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if let sections = self.fetchedResultsController.sections {
            return (sections[section] as! NSFetchedResultsSectionInfo).numberOfObjects
        }
        
        return count(people)
    }

//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsToBeStalked", forIndexPath: indexPath) as! UITableViewCell
//
//        // prints the key of the current people dictionary
//        // as each dictionary only has one key, leaving array[0] should be ok
//        cell.textLabel!.text = people[indexPath.row]["name"] as? String
//
//        return cell
//    }
//
//    
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            
//            
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            
//            
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    
    // function that takes in the text field entered at addNewViewController
    func appendingNewContact(name : String) -> Dictionary<String, AnyObject> {
        // also rendering the string into a dictionary for the parent var, people
        let newPersonDict : Dictionary<String, AnyObject> = [
            "name" : name,
            // leaving the info empty as it will be appending at another stage
            "info" : [""]
        ]
        
        return newPersonDict
        
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Step 1: Dequeue the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsToBeStalked")! as! UITableViewCell
        
        self.configureCell(cell, indexPath: indexPath)
        
        // Step 4: Return the configured cell
        return cell
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        // Step 2: Retreive the data
        let profile = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Entity
        
        // Step 3: Configure the cell
        cell.textLabel!.text = profile.name
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            self.peopleCollection.deleteProfile(indexPath)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }
    }
    
    /* called first
    begins update to `UITableView`
    ensures all updates are animated simultaneously */
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    /* called:
    - when a new model is created
    - when an existing model is updated
    - when an existing model is deleted */
    func controller(controller: NSFetchedResultsController,
        didChangeObject object: AnyObject,
        atIndexPath indexPath: NSIndexPath?,
        forChangeType type: NSFetchedResultsChangeType,
        newIndexPath: NSIndexPath?) {
            switch type {
            case .Insert:
                self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
            case .Update:
                let cell = self.tableView.cellForRowAtIndexPath(indexPath!)
                self.configureCell(cell!, indexPath: indexPath!)
                self.tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            case .Move:
                self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
                self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
            case .Delete:
                self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            default:
                return
            }
    }
    
    /* called last
    tells `UITableView` updates are complete */
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }
    
    
    @IBAction func unwindMediums(segue : UIStoryboardSegue) {
        var info = (segue.sourceViewController as! MediumsTableViewController).mediums
        
        var row = tableView.indexPathForSelectedRow()!.row
        
        people[row]["info"] = info
        
    }

    @IBAction func unwindAddNewContact(segue : UIStoryboardSegue) {

        self.tableView.reloadData()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        // if statement to decide whether to pass objects to new class
        if segue.identifier == "segueToMediums" {
            
            var row = tableView.indexPathForSelectedRow()!.row
            
            // passing the array of strings from within info of people to new class
            (segue.destinationViewController as! MediumsTableViewController).mediums = people[row]["info"]! as! [String]
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let notesFestchRequest = NSFetchRequest(entityName: "Entity")
        let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: true)
        notesFestchRequest.sortDescriptors = [sortDescriptor]
        
        if let profiles = appDelegate!.managedObjectContext!.executeFetchRequest(notesFestchRequest, error: nil) as? [Entity] {
            for profile in profiles {
                println(profile.name)
                println(profile.mediums)
                println("\(profile.dateAdded) /n")
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
