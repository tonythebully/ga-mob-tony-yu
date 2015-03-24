//
//  AddContactInfoViewController.swift
//  PersonalWeeklyProject
//
//  Created by Tony Yu on 24/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit

class AddContactInfoViewController: UIViewController {

    @IBOutlet weak var mediumTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediumTextField.text = "hi"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
