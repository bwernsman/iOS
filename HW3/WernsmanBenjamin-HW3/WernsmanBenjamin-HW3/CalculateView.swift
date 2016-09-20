//
//  CalculateView.swift
//  WernsmanBenjamin-HW3
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class CalculateView: UIViewController {
    
    // Used to store the name and type passed in via the segue
    var operatorName = String()
    var operatorType = String()
    
    //Set Outlets
    @IBOutlet weak var opOne: UITextField!
    @IBOutlet weak var opTwo: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var op: UILabel!
    
    //When the Calculate Button is pressed, make sure the inputs are valid
    //If the inputs are valid, calculate the expected response and set it to the label "result"
    //Dismiss keyboard after the result shows up
    @IBAction func calcButton(sender: AnyObject) {
        let opOneInput:(Double,Bool) = checkInput(opOne.text!)
        let opTwoInput:(Double,Bool) = checkInput(opTwo.text!)
        
        if(opOneInput.1 && opTwoInput.1){
            result.alpha = 1
            result.text! = String(calcInput(opOneInput.0,opTwoInput: opTwoInput.0))
        }
        
        self.view.endEditing(true)
    }
    
    //When the view loads, set the keybaord to "numbers"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        opOne.keyboardType = UIKeyboardType.DecimalPad
        opTwo.keyboardType = UIKeyboardType.DecimalPad
        opOne.becomeFirstResponder()
        
        result.alpha = 0
    }
    
    //When the view appears, set the title and operator
    override func viewWillAppear(animated: Bool) {
        self.title = operatorName
        op.text = operatorType
    }
    
    //Make sure input is valid
    //Return a double (amount) and then a bool (to determine if the parsing succeded)
    func checkInput(input:String) -> (Double,Bool){
        if let val = Double(input){
            return (val,true)
        }
        else{
            showError("Please enter a valid number")
            return (0,false)
        }
    }
    
    //Calcualte the expected result
    func calcInput(opOneInput:Double, opTwoInput:Double) -> Double{
        if(operatorType == "+"){
            return opOneInput + opTwoInput
        }
        else if (operatorType == "-"){
            return opOneInput - opTwoInput
        }
        else if(operatorType == "*"){
            return opOneInput * opTwoInput
        }
        else{
            return opOneInput / opTwoInput
        }
    }
    
    //If the user gives an invalid input, alert them
    func showError(errorMessage:String){
        let alertController = UIAlertController(title: "ERROR", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //Check if there is a memory warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

