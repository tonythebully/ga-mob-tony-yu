//
//  ViewController.swift
//  TonyCalculator
//
//  Created by Tony Yu on 31/03/2015.
//  Copyright (c) 2015 loljk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var operation: String? = nil
    var previousValue = 0
    var previousButtonWasNumber = false


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func numberButtonTapped(sender: UIButton) {
        
        // this looks at what the text on the button was, to determine what is the input
        let numberString = sender.titleForState(.Normal)!
        // when this is fresh, simply replace the outputLabel with the first input number
        if (self.previousButtonWasNumber == false || self.outputLabel.text! == "0") {
            self.outputLabel!.text = numberString
            
        // when it already had a number, append the number to the back of the number that already exists on the outputLabel, eg 1 -> 11
        } else {
            self.outputLabel!.text = "\(self.outputLabel!.text!)\(numberString)"
        }
        self.previousButtonWasNumber = true
    }

    @IBAction func operationButtonTapped(sender: UIButton) {
        
        // this looks what the text on the button was, to determine what is the input
        let operationString = sender.titleForState(.Normal)!

        
        // assigning the current number value as previous value and storing it
        if (previousButtonWasNumber) {
            println("assigning previousVale to \(self.outputLabel!.text!.toInt()!)")
            self.previousValue = self.outputLabel!.text!.toInt()!
        }

        if (self.operation != nil) {
            println("there are previous operations, which was \(self.operation!)")
            self.equalsButtonTapped(sender)
            self.previousValue = self.outputLabel!.text!.toInt()!
        // in the event that there had not been a previous operation, save the input operation as well as resetting the outputLabel to 0
        } else {
            println("there had been no previous operations")
            self.operation = operationString
        }
        self.previousButtonWasNumber = false
    }
    
    @IBAction func equalsButtonTapped(sender: UIButton) {
        var previousValue = self.previousValue
        var result: String
        result = self.calculate(self.operation)


        if (sender.titleForState(.Normal)! == "="){
            println("was actual =")
            self.outputLabel.text! = result
            previousValue = self.outputLabel!.text!.toInt()!
            self.operation = nil
        } else {
            println("not actual =")
            previousValue = result.toInt()!
        }
        self.previousValue = previousValue
        self.previousButtonWasNumber = false
    }

    @IBAction func swipeToClear(sender: UISwipeGestureRecognizer) {
        clearAll()
    }
    
    func clearAll() {
        self.operation = nil
        self.previousValue = 0
        self.previousButtonWasNumber = false
        self.outputLabel.text = "0"
        println("input and memory cleared")
    }
    
    func calculate(operationType: String!) -> String {
        if (self.operation == nil) {
            return "void"
            
        } else if (operationType == "÷") {
            println("the operation is \(previousValue) / \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue / self.outputLabel!.text!.toInt()!)"
            
        } else if (operationType == "×") {
            println("the operation is \(previousValue) * \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue * self.outputLabel!.text!.toInt()!)"
            
        } else if (operationType == "+") {
            println("the operation is \(previousValue) + \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue + self.outputLabel!.text!.toInt()!)"
            
        } else if (operationType == "−") {
            println("the operation is \(previousValue) - \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue - self.outputLabel!.text!.toInt()!)"
        } else {
            self.clearAll()
            return "Error"
        }
    }
}

