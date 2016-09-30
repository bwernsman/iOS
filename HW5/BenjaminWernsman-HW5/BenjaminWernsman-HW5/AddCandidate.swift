//
//  AddCandidate.swift
//  WernsmanBenjamin-HW4
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

//Data model protocol
protocol DataModelProtocol:class {
    func notify(message:String)
}

class AddCandidate: UIViewController {
    
    //Outlets for all the user inputs needed to create a candidate
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var party: UISegmentedControl!
    @IBOutlet weak var status: UILabel!
    
    var delegate: DataModelProtocol?
    
    //When the user taps the save button, check to make sure the input is valid 
    //Use trimming to make sure the user does not enter a name with only spaces Ex: " " is not a name
    //If successfull, add the candidate to the model
    //If error, alert the user there is a problem
    @IBAction func saveButton(sender: AnyObject) {
        if(first_name.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && last_name.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && state.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != ""){
            
            //Change to send info back
            //userStorage.candidates.append(Candidate(first_name: first_name.text!,last_name: last_name.text!,state: state.text!, party: party.titleForSegmentAtIndex(party.selectedSegmentIndex)!,votes: 0))
            
            if let delegate = self.delegate {
                delegate.notify("Heyyyyyy")
            }
            
            status.alpha = 1.0
            status.text = "Candidate saved"
        }else{
            showError("Please enter valid input")
        }
    }
    
    //Set the title when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Candidate"
    }
    
    //When the view is about to appear, make the status invisable until the a candidate is created
    override func viewWillAppear(animated: Bool) {
        status.alpha = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //If the user gives an invalid input, alert them
    func showError(errorMessage:String){
        let alertController = UIAlertController(title: "ERROR", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
