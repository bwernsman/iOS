//
//  ViewController.swift
//  BenjaminWernsman-HW7
//
//  Created by Ben Wernsman on 10/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SkiAreaDataProtocol {
    
    var skiAreaData = SkiAreaData()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!

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
            self.skiAreaData.getData(zipcodeField.text!)
        }
    }
    
    //Set delegate and background color
    override func viewDidLoad() {
        super.viewDidLoad()
        self.skiAreaData.delegate = self
        self.view.backgroundColor = UIColor(red: 149/255, green: 237/255, blue: 252/255, alpha: 1)
    }
    override func viewDidAppear(animated: Bool) {
        indicator.alpha = 0
        messageLabel.alpha = 0
    }

    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func responseDataHandler(data:NSDictionary) {
        dispatch_async(dispatch_get_main_queue()) {
            self.indicator.stopAnimating()
            self.countryLabel.text = (data["country"]! as! String)
            self.regionLabel.text = (data["region"]! as! String)
            self.areaLabel.text = (data["area"]! as! String)
        }
    }
    
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
    
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}

