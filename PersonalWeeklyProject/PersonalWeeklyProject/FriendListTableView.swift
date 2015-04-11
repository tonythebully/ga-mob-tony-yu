//
//  TableViewOfFriendList.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 21/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit

class FriendListTableView: UITableViewController {

    var people : [Dictionary<String, AnyObject>] = [
        [
            "name" : "add a new contact!",
            "info" : ["Where would you stalk them?", "Perhaps youtube links, home address, etc"]
            
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return count(people)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsToBeStalked", forIndexPath: indexPath) as! UITableViewCell

        // prints the key of the current people dictionary
        // as each dictionary only has one key, leaving array[0] should be ok
        cell.textLabel?.text = people[indexPath.row]["name"] as? String

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
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
    @IBAction func unwindMediums(segue : UIStoryboardSegue) {
        var info = (segue.sourceViewController as! MediumsTableViewController).mediums
        
        var row = tableView.indexPathForSelectedRow()!.row
        
        people[row]["info"] = info
        
    }

    @IBAction func unwindAddNewContact(segue : UIStoryboardSegue) {
        // passing the name back from the addNewViewController
        let name = (segue.sourceViewController as! AddNewViewController).newContactTextField.text
        
        // appending the new contact dictionary onto the list of contacts
        people.append(appendingNewContact(name))
        
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
}
