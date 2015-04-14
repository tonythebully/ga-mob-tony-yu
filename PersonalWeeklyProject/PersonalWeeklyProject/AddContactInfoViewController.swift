//
//  AddContactInfoViewController.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 24/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import CoreData

class AddContactInfoViewController: UIViewController {
    
    var appDelegate: AppDelegate?

    @IBOutlet weak var mediumTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediumTextField.text = "hi"
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        let mediumFetchRequest = NSFetchRequest(entityName: "Entity")
        let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: false)
        
        let newProfile: Dictionary<String, AnyObject> = [
            "name" : self.mediumTextField.text!,
            "info" : [""]
        ]
        
        note.friends = newProfile
        
        appDelegate!.saveContext()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
