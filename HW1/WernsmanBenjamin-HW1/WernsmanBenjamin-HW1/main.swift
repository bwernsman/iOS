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
var titles:[String] = ["Pride and Prejudice","The Two Towers","The Lion, the Witch and the Wardrobe","The Bell Jar"]
var authors:[String] = ["Jane Austen", "J.R.R. Tolkien", "C.S. Lewis", "Sylvia Plath"]
var pageNumbers:[Int] = [1214,624,245,2145]
var bookType:[String] = ["hardcover","softcover","eBook","eBook"]
var prices:[Float] = [10.00, 11.00, 12.00, 11.50]

//Used to calculate the percentage increase in cost of a book
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


