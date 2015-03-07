//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var inputNumberField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    @IBAction func determineOddorEven(sender: AnyObject) {
        if inputNumberField.text.toInt() != nil && inputNumberField.text.toInt() != Int() && inputNumberField.text.toInt() != 0 {
                if inputNumberField.text.toInt()! % 2 == 0 {
                    outputLabel.text = "This number is even"
                } else {
                    outputLabel.text = "This number is odd"
                }
        } else {
            outputLabel.text = "Enter a valid number please"
        }
        
    }
}
