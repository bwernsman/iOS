//
//  ViewController.swift
//  WernsmanBenjamin-HW2
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/6/16.
//  Copyright © 2016 GlassFlag Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Text labels used in the project (user ID, password, status)
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var status: UILabel!
    
    //Login button action (when the button gets pressed)
    @IBAction func buttonPressed(sender: AnyObject) {
        checkLogin()
    }
    
    //Bring up the keyboard when the view loads and let the user start typing in the user ID field
    //Set delegates so the user can hit "next" to go to the next text field
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userID.becomeFirstResponder()
        password.secureTextEntry = true
        self.userID.delegate = self
        self.password.delegate = self
    }
    
    //Check for memory warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Used to manage taps outside of the text fields to hide the keyboard
    @IBAction func tapManager(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    //Check if the login was valid
    //Make sure a username can't be only spaces (Ex: "  ")
    func checkLogin(){
        if(userID.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" && password.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != ""){
            status.text = "\(userID.text!) logged in"
        } else {
            status.text = "Invalid login"
        }
        self.view.endEditing(true)
    }
    
    //Delegate function used to determine what should happen when "Next" is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(textField == userID){
            userID.resignFirstResponder()
            password.becomeFirstResponder()
            return true
        }
        else{
            self.view.endEditing(true)
            return false
        }
    }


}

