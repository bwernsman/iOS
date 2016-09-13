//
//  CalculateView.swift
//  WernsmanBenjamin-HW3
//
//  Created by Ben Wernsman on 9/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class CalculateView: UIViewController {
    
    @IBOutlet weak var opOne: UITextField!
    @IBOutlet weak var opTwo: UITextField!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func calcButton(sender: AnyObject) {

        
        print(opOne.text!)
    }
    
    // Use teamName to set label
    var operatorType = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = operatorType
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

