//
//  ViewController.swift
//  BenjaminWernsman-HW7
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 10/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SkiAreaDataProtocol {
    
    //Connects our network class to the view controller class
    var skiAreaData = SkiAreaData()
    
    //UI Elements
    //Used an indicator to show when the user is waiting for a response
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    //When the data button is pressed, error check to make sure zip code is not empty 
    //If it is, we alert the user, Else, the information is set to our networking class
    @IBAction func DataBtn(sender: AnyObject) {
        if(zipcodeField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == ""){
            dispatch_async(dispatch_get_main_queue()) {
                self.showAlert("Error",message: "Please enter a valid Zip Code")
            }
        }
        else{
            self.messageLabel.alpha = 0
            self.messageLabel.text = ""
            self.indicator.alpha = 1
            self.indicator.startAnimating()
            self.indicator.hidesWhenStopped = true
            
            let backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
            dispatch_async(backgroundQueue){
               self.skiAreaData.getData(self.zipcodeField.text!)
            }
        }
    }
    
    //Set delegate and background color
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skiAreaData.delegate = self
    }
    
    //When the view appears, hide the indicator and message label
    override func viewDidAppear(animated: Bool) {
        indicator.alpha = 0
        messageLabel.alpha = 0
    }

    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //After the network call occurs, display the expected output
    func responseDataHandler(data:NSDictionary) {
        dispatch_async(dispatch_get_main_queue()) {
            self.indicator.stopAnimating()
            self.countryLabel.text = (data["country"]! as! String)
            self.regionLabel.text = (data["region"]! as! String)
            self.areaLabel.text = (data["area"]! as! String)
        }
    }
    
    //After the network call occurs, if there was an error, this will be called
    func responseError(message:String) {
        dispatch_async(dispatch_get_main_queue()) {
            self.indicator.stopAnimating()
            self.countryLabel.text = ""
            self.regionLabel.text = ""
            self.areaLabel.text = ""
            self.messageLabel.alpha = 1
            self.messageLabel.text = message
        }
    }
    
    //Display an alert to the user if the "Zip Code" field was empty
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}

