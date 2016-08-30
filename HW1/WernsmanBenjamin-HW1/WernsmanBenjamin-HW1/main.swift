//
//  main.swift
//  WernsmanBenjamin-HW1
//
//  Created by Ben Wernsman on 8/30/16.
//  Copyright © 2016 wernsman. All rights reserved.
//

import Foundation

var bookObjects:[Book] = []
var titles:[String] = ["Moby Dick","Harry Potter and the Goblet of Fire","Justin Bieber: a Biography","Simple iOS Programming in Swift","Swifty"]

func main(){
    for count in 1...4 {
        bookObjects.append(Book(title: titles[count], author: "Ben", numberOfPages: 10, bookType: "eCopy", price: 10.00))
        //bookObjects.append("hey")
        print("hu")
    }
}

main()

//Changed var to let??!
func randomUIntInRange(min:UInt32, max:UInt32) -> UInt32 {
    let randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
    return randomValue
}
