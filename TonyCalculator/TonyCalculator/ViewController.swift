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
    var previousValue: Double = 0
    var previousButtonWasNumber = false
    var isDecimal = false

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

    @IBAction func decimalOperation(sender: UIButton) {
        if (!isDecimal) {
            self.outputLabel!.text = "\(self.outputLabel!.text!)."
        }
    }
    
    @IBAction func operationButtonTapped(sender: UIButton) {
        
        // this looks what the text on the button was, to determine what is the input
        let operationString = sender.titleForState(.Normal)!

        
        // assigning the current number value as previous value and storing it
        if (previousButtonWasNumber) {
            println("assigning previousVale to \((self.outputLabel!.text! as NSString).doubleValue)")
            self.previousValue = (self.outputLabel!.text! as NSString).doubleValue
        }

        // in the case that operations had been entered without equating, equate what whats previously entered then accepts new inputs
        if (self.operation != nil) {
            println("there are previous operations, which was \(self.operation!)")
            self.equalsButtonTapped(sender)
            self.previousValue = (self.outputLabel!.text! as NSString).doubleValue
        // in the event that there had not been a previous operation, save the input operation as well as resetting the outputLabel to 0
        } else {
            println("there had been no previous operations")
            self.operation = operationString
        }
        self.previousButtonWasNumber = false
    }
    
    // determines whether what the previously entered buttons are a standard operation or not, then calls func calculate in different conditions
    @IBAction func equalsButtonTapped(sender: UIButton) {
        var previousValue = self.previousValue
        var result: NSString
        result = self.calculate(self.operation)

        // case for when the equal button is actually pressed
        if (sender.titleForState(.Normal)! == "="){
            println("was actual =")
            self.outputLabel.text! = result
            previousValue = (self.outputLabel!.text! as NSString).doubleValue
            self.operation = nil
            
        // case for when this function is called when multiple operations had been entered
        } else {
            println("not actual =")
            previousValue = result.doubleValue
        }
        
        // saves value if needed, reseting the state of previous button
        self.previousValue = previousValue
        self.previousButtonWasNumber = false
    }

    // simply calls the clear function
    @IBAction func swipeToClear(sender: UISwipeGestureRecognizer) {
        clearAll()
    }
    
    // this function resets all values back to its initial state, thus reseting the state of the calculator
    func clearAll() {
        self.operation = nil
        self.previousValue = 0
        self.previousButtonWasNumber = false
        self.outputLabel.text = "0"
        println("input and memory cleared")
    }
    
    // this function does the actual calculations based on the previous operation type and returns results
    func calculate(operationType: String!) -> String {
        let currentValue = (self.outputLabel.text! as NSString).doubleValue
        
        if (self.operation == nil) {
            return "void"
            
        } else if (operationType == "÷") {
            println("the operation is \(previousValue) / \((self.outputLabel!.text))")
            return "\(previousValue / currentValue)"
            
        } else if (operationType == "×") {
            println("the operation is \(previousValue) * \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue * currentValue)"
            
        } else if (operationType == "+") {
            println("the operation is \(previousValue) + \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue + currentValue)"
            
        } else if (operationType == "−") {
            println("the operation is \(previousValue) - \(self.outputLabel!.text!.toInt()!)")
            return "\(previousValue - currentValue)"
        } else {
            self.clearAll()
            return "Error"
        }
    }
}

