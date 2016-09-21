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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Candidate"
        
        userStoage.candidates.append(Candidate(first_name: "Ben",last_name: "W"))
        
        print("added candidate")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
