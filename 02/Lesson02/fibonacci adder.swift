//
//  fibonacci adder.swift
//  Lesson02
//
//  Created by Tony Yu on 9/03/2015.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class fibonacci_adder : NSObject{

    weak var outputLabel : UILabel!
    //to associate with the label from the FourthViewController class so it could change the label from this class
    
    func fibonacciNumberAtIndex (indexOfFibonacciNumber : Int) {
        //would have loved to have a return value for this function, but since it is specified, the action to change the label is done here

        if indexOfFibonacciNumber != 0{
            var result : Int = 0
            var previousResult : Int = 0
            
            
            for var i = 0; i < indexOfFibonacciNumber; i++ {
                
                if i < 2 {
                    result = i
                    //had to put in special consideration for 1st and 2nd iteration as they do not have a previous value to use
                } else {
                    var resultHolder : Int
                    resultHolder = result
                    result = result + previousResult
                    previousResult = resultHolder
                }
                
            }
            if let label = outputLabel {
                label.text! = "\(result)"
                //safety check and changing the label
            }
        }
    }

}
