//
//  CandidateDetail.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/21/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class CandidateDetail: UIViewController {
    
    @IBOutlet weak var first_name: UILabel!
    @IBOutlet weak var last_name: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var party: UILabel!
    @IBOutlet weak var votes: UILabel!
    
    var indexTapped:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Candidate Detail"
    }
    
    override func viewWillAppear(animated: Bool) {
        //first_name.textAlignment = NSTextAlignment.Left
        first_name.text! = userStorage.candidates[indexTapped].first_name
        last_name.text! = userStorage.candidates[indexTapped].last_name
        state.text! = userStorage.candidates[indexTapped].state
        party.text! = userStorage.candidates[indexTapped].party
        votes.text! = String(userStorage.candidates[indexTapped].votes)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
