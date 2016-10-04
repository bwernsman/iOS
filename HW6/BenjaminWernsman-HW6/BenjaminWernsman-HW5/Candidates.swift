//
//  Candidates.swift
//  WernsmanBenjamin-HW5
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 10/2/16.
//  Copyright © 2016 Ben Wernsman. All rights reserved.
//

import Foundation

//User to store information about all the candidates
//fromView, is used to tracks the views used for the popover, making sure that the correct information is given to the user

class Candidates {
    var candidates:[Candidate] = []
    var fromView:String = ""
    var currentID:Int64 = 0
}

var candidateManager = Candidates()
