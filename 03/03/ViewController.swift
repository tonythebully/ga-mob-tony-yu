//
//  ViewController.swift
//  03
//
//  Created by Tony Yu on 13/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func DismissModule(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

