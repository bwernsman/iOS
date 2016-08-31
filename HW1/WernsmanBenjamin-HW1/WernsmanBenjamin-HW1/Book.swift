//
//  Book.swift
//  WernsmanBenjamin-HW1
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 8/30/16.
//  Copyright © 2016 wernsman. All rights reserved.
//

import Foundation

class Book{
    
    //Define variables (title, author, number of pages, type of book and the price)
    private var title:String
    private var author:String
    private var numberOfPages:Int
    private var bookType:String
    private var price:Float
    
    //Initialize the variables
    init(title:String, author:String, numberOfPages:Int, bookType:String, price:Float){
        self.title = title
        self.author = author
        self.numberOfPages = numberOfPages
        self.bookType = bookType
        self.price = price
    }
    
    //Create a Book and return it
    static func create(title:String, author:String, numberOfPages:Int, bookType:String, price:Float) -> Book{
        return Book(title: title,author: author,numberOfPages: numberOfPages,bookType: bookType,price: price)
    }
    
    //Set the title
    func setTitle(title:String) {
        self.title = title
    }
    
    //Get the title
    func getTitle() -> String {
        return self.title
    }
    
    //Set the author
    func setAuthor(author:String) {
        self.author = author
    }
    
    //Get the author
    func getAuthor() -> String {
        return self.author
    }
    
    //Set the number of pages
    func setNumberOfPages(numberOfPages:Int) {
        self.numberOfPages = numberOfPages
    }
    
    //Get the number of pages
    func getNumberOfPages() -> Int {
        return self.numberOfPages
    }
    
    //Set the book type
    func setBookType(bookType:String) {
        self.bookType = bookType
    }
    
    //Get the book type
    func getBookType() -> String {
        return self.bookType
    }
    
    //Set the price
    func setPrice(price:Float) {
        self.price = price
    }
    
    //Get the price
    func getPrice() -> Float {
        return self.price
    }
    
    //Return all the variables as a String
    func description() -> String{
        return "Title: \"" + self.title + "\"\nAuthor: " + self.author + "\n# Pages: " + String(self.numberOfPages) + "\nBook Type: " + self.bookType + "\nPrice: " + String(self.price)
     }
    
}
