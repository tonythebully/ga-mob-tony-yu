//
//  ProfileDetailViewController.swift
//  Star Chaser
//
//  Created by Tony Yu on 30/04/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import Parse

class ProfileDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameTextLabel: UILabel!
    @IBOutlet weak var titleTextLabel: UILabel!
    
    var profileObject: PFObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        
        if let profile = profileObject {
            
            titleTextLabel.text = profile["title"] as? String
            
            let firstName = profile["firstName"] as! String
            let lastName = profile["lastName"] as! String
            fullNameTextLabel.text = "\(firstName) \(lastName)"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
