//
//  AddCandidate.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class AddCandidate: UIViewController {
    
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var party: UISegmentedControl!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func saveButton(sender: AnyObject) {
        if(first_name.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && last_name.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && state.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != ""){
            userStorage.candidates.append(Candidate(first_name: first_name.text!,last_name: last_name.text!,state: state.text!, party: party.titleForSegmentAtIndex(party.selectedSegmentIndex)!,votes: 0))
            status.alpha = 1.0
            status.text = "Candidate saved"
        }else{
            showError("Please enter valid input")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Candidate"
    }
    
    override func viewWillAppear(animated: Bool) {
        status.alpha = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //If the user gives an invalid input, alert them
    func showError(errorMessage:String){
        let alertController = UIAlertController(title: "ERROR", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
