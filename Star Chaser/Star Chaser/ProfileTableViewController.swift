//
//  ProfileTableViewController.swift
//  Star Chaser
//
//  Created by Tony Yu on 30/04/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import Parse

class ProfileTableViewController: UITableViewController {
    
    var profiles: [AnyObject] = [AnyObject]()
//    let parseHelper = parseHelperClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProfileFromParse()
        getPinnedProfiles()
        
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
        return profiles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("profile cells", forIndexPath: indexPath) as! ProfileTableViewCell

        var firstName = profiles[indexPath.row]["firstName"] as! String
        var lastName = profiles[indexPath.row]["lastName"] as! String
        var title = profiles[indexPath.row]["title"] as? String
        
        cell.maintitleTextLabel?.text = title
        cell.subtitleTextLabel?.text = "\(firstName) \(lastName)"

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            removeProfile(indexPath)
            profiles.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "Segue to Profile Detail" {
            let pressedButton = sender as! UIButton
            let cell = pressedButton.superview?.superview as! UITableViewCell
            
            self.tableView.indexPathForCell(cell)
            
            let row = tableView.indexPathForCell(cell)!.row
            ((segue.destinationViewController as! UINavigationController).viewControllers[0] as! ProfileDetailViewController).profileObject = profiles[row] as? PFObject
        }
    }
    
    
    //get all the pinned profiles and place them in the profiles container
    func getPinnedProfiles() {
        let getProfileQuery = PFQuery(className: "Profiles")
        getProfileQuery.fromLocalDatastore()
        getProfileQuery.findObjectsInBackgroundWithBlock() { objects, error in
            if let queryProfiles = objects {
                self.profiles = queryProfiles
                self.tableView.reloadData()
                println("the local profiles:\(self.profiles)")
            }
        }
    }
    // get all the profiles from remote and pin them for local use
    func getProfileFromParse() {
        let getProfileQuery = PFQuery(className: "Profiles")
        getProfileQuery.findObjectsInBackgroundWithBlock() { objects, error in
            if let queryProfiles = objects {
//                self.profiles = queryProfiles
                for queryProfile in queryProfiles {
                    queryProfile.pin()
                }
                self.tableView.reloadData()
                println("the remote profiles:\(self.profiles)")
            }
        }
    }
    
    //create a new profile then saving it in parse while pinning it locally for use
    func addProfile(firstName: String, lastName: String, title: String) {
        let profileObject = PFObject(className: "Profiles")
        profileObject["title"] = title
        profileObject["firstName"] = firstName
        profileObject["lastName"] = lastName
        profileObject.saveInBackground()
        profileObject.pin()
        
    }
    
    func removeProfile(indexPath: NSIndexPath) {
        profiles[indexPath.row].unpinInBackground()
        profiles[indexPath.row].deleteInBackground()
        
    }
    @IBAction func unwindFromAddNewProfile(segue: UIStoryboardSegue) {
        var firstName = (segue.sourceViewController as! AddNewProfileViewController).firstNameTextField
        var lastName = (segue.sourceViewController as! AddNewProfileViewController).lastNameTextField
        var title = (segue.sourceViewController as! AddNewProfileViewController).titleTextField
        
        self.addProfile(firstName.text, lastName: lastName.text, title: title.text)
        self.getPinnedProfiles()
        self.tableView.reloadData()
    }

}
