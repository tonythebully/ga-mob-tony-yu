//
//  AddNewViewController.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 21/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit
import CoreData

class AddNewViewController: UIViewController {

    @IBOutlet weak var newContactTextField: UITextField!
    var appDelegate: AppDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CreateNewProfile(sender: UIBarButtonItem) {
        let peopleCollectionClass = PeopleCollection()
        peopleCollectionClass.appendNewProfile(self.newContactTextField.text!)
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    override func viewDidDisappear(animated: Bool) {

//        let note = NSEntityDescription.insertNewObjectForEntityForName("Entity", inManagedObjectContext: appDelegate!.managedObjectContext!) as! Entity
//        
//        
//        if (self.newContactTextField.text != nil) {
//            note.name = self.newContactTextField.text!
//        }
//        
//        appDelegate!.saveContext()
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
