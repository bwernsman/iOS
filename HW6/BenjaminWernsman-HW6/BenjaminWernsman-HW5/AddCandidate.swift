//
//  AddCandidate.swift
//  WernsmanBenjamin-HW5
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class AddCandidate: UIViewController, DataModelProtocol {
    
    //Outlets for all the user inputs needed to create a candidate
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var party: UISegmentedControl!
    @IBOutlet weak var status: UILabel!
    
    //When the user taps the save button, check to make sure the input is valid 
    //Use trimming to make sure the user does not enter a name with only spaces Ex: " " is not a name
    //If successfull, add the candidate to the model
    //If error, alert the user there is a problem
    @IBAction func saveButton(sender: AnyObject) {
        let controller = CandidateManager(nibName: "CandidateManager", bundle: nil)
        controller.delegate = self
        
        if(first_name.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && last_name.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && state.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != ""){
            
            //notify user
            
            let newCandidate:Candidate = Candidate(first_name: first_name.text!,last_name: last_name.text!,state: state.text!, party: party.titleForSegmentAtIndex(party.selectedSegmentIndex)!,votes: 0, id: -1)
            
            NSNotificationCenter.defaultCenter().postNotificationName("notifyAddUserNotification", object: newCandidate)
            
        }else{
            controller.delegate?.notify("Please enter valid input")
        }
    }
    
    //Set the title when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Candidate"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AddCandidate.notifyAlert(_:)),name:"alert", object: nil)
    }
    
    //Notify the user when data is saved
    func notifyAlert(notification: NSNotification){
        let success:Bool = notification.object as! Bool
        if(success){
            notify("Data has been saved")
        }
        else{
            notify("Error storing data to persistent storage")
        }
    }
    
    //When the view is about to appear, make the status invisable until the a candidate is created
    override func viewWillAppear(animated: Bool) {
        status.alpha = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Dispatch an alert with the given message
    func notify(message:String){
        dispatch_async(dispatch_get_main_queue()){
            self.showAlert("Alert",message: message)
        }
    }
    
    //If the user gives an invalid input, alert them
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
