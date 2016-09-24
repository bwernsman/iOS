//
//  Storage.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/21/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation

//User to store information about all the candidates
//fromView, is used to tracks the views used for the popover, making sure that the correct information is given to the user

class Storage {
    var candidates:[Candidate] = []
    var fromView:String = ""
}

var userStorage = Storage()
