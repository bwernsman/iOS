//
//  CandidateManager.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class CandidateManager: UIViewController {
    
    var tableView = UITableView()
    
    @IBAction func voteButton(sender: AnyObject) {

    }
    
    @IBAction func ShowVotesButton(sender: AnyObject) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Candidate Manager"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Create a custom bar button so it says "Back"
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
    }

}
