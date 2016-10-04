//
//  Candidate.swift
//  WernsmanBenjamin-HW5
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/21/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation

//Candidate class that stores all the information for a candidate
class Candidate {
    var first_name:String
    var last_name:String = ""
    var state:String = ""
    var party:String = ""
    var votes:Int64 = 0
    var id:Int64 = 0
    
    //Initialize the class
    init(first_name:String, last_name:String, state:String, party:String, votes:Int64, id:Int64) {
        self.first_name = first_name
        self.last_name = last_name
        self.state = state
        self.party = party
        self.votes = votes
        self.id = id
    }
    
    //Add a vote
    func addVote() -> Int64{
        self.votes += 1
        return self.votes
    }
    
    //Return amount of votes
    func getVotes() -> String{
        return "Votes: " + String(self.votes)
    }
    
    //Return the candidates full name
    func getName() -> String {
        return self.first_name + " " + self.last_name
    }
    
}

