//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var inputNumberField: UITextField!
    @IBOutlet weak var outputNumberLabel: UILabel!
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.

    @IBAction func addingNumbers(sender: AnyObject) {
        var sum : Int
        if outputNumberLabel.text?.toInt() == 0 {
            if inputNumberField.text.toInt() != nil{
                outputNumberLabel.text = inputNumberField.text
            } else if (inputNumberField.text.toInt() != Int()) {
                outputNumberLabel.text = "0"
            }
        } else {
            sum = outputNumberLabel.text!.toInt()!
            sum += inputNumberField.text.toInt()!
            outputNumberLabel.text = "\(sum)"
        }
        
    }
}
