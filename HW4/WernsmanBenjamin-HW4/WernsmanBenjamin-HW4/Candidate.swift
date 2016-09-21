//
//  Candidate.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/21/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation

class Candidate {
    var first_name:String
    var last_name:String = ""
    var state:String = ""
    var party:String = ""
    var votes:Int = 0
    
    init(first_name:String, last_name:String) {
        self.first_name = first_name
        self.last_name = last_name
    }
    
    func addVote() -> Int{
        self.votes += 1
        return self.votes
    }
    
    static func createCandidate(first_name:String, last_name:String) -> Candidate{
        return Candidate(first_name: first_name, last_name: last_name)
    }

}

