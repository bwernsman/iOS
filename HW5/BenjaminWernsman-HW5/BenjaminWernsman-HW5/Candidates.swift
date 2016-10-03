//
//  Candidates.swift
//  WernsmanBenjamin-HW5
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
}

var candidateManager = Candidates()
