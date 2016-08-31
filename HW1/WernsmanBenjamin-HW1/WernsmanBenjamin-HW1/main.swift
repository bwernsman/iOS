//
//  main.swift
//  WernsmanBenjamin-HW1
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 8/30/16.
//  Copyright © 2016 wernsman. All rights reserved.
//

import Foundation

//Define variables for Books (books storage, title, author, number of pages, type of book and the price)
var bookObjects:[Book] = []
var titles:[String] = ["Moby Dick","Harry Potter and the Goblet of Fire","Justin Bieber: a Biography","Simple iOS Programming in Swift"]
var authors:[String] = ["Herman Melville", "J.K. Rowling", "Selena Gomez", "Bill Bulko"]
var pageNumbers:[Int] = [1834,523,13,2145]
var bookType:[String] = ["softcover","hardcover","eBook","hardcover"]
var prices:[Float] = [10.00, 11.00, 12.00, 13.00]

//Used to calculate the percentage increase in cost of a book
//Changed var to let??!
func randomUIntInRange(min:UInt32, max:UInt32) -> UInt32 {
    let randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
    return randomValue
}

//Creates 4 book objects
//Changes the price 10X depending on the percentage calculated
//Rounds the float to the nearest dollar value
//Updates the current price
//Prints out 4 books
func main(){
    for index in 0...3 {
        bookObjects.append(Book.create(titles[index], author: authors[index], numberOfPages: pageNumbers[index], bookType: bookType[index], price: prices[index]))
        for _ in 1 ... 10 {
            var price:Float = bookObjects[index].getPrice()
            let percentage:Float = Float(randomUIntInRange(0,max: 10))/100
            price = (price * percentage) + price
            price = Float(round(100*price)/100)
            bookObjects[index].setPrice(price)
        }
        print(bookObjects[index].description() + "\n")
    }
}

main()


