//
//  FourthViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var inputNumberField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
/*
    TODO seven: Hook up the text input box, label and and a ‘calculate’ button. Create a ‘fibonacci adder’ class with a method ‘fibonacciNumberAtIndex' which takes indexOfFibonacciNumber (an integer).  When the button is pressed, create an instance of that class, call the method, and print out the appropriate fibonacci number of an inputted integer.
    The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number.
*/
    @IBAction func displayXthFibonacciNumber(sender: AnyObject) {
        if inputNumberField.text.toInt() != nil && inputNumberField.text.toInt() != Int() && inputNumberField.text.toInt() != 0{
            var result : Int = 0
            var previousResult : Int = 0
            
            
            for var i = 0; i < inputNumberField.text.toInt(); i++ {
                
                if i < 2 {
                    result = i
                } else {
                    var resultHolder : Int
                    resultHolder = result
                    result = result + previousResult
                    previousResult = resultHolder
                }
                
            }
            outputLabel.text = "\(result)"
        }
    }
}
