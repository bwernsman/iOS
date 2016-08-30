//
//  Book.swift
//  WernsmanBenjamin-HW1
//
//  Created by Ben Wernsman on 8/30/16.
//  Copyright © 2016 wernsman. All rights reserved.
//

import Foundation

class Book{
    private var title:String = ""
    private var author:String = ""
    private var numberOfPages:Int = 0
    private var bookType:String = ""
    private var price:Float = 0.0
    
    //Initialize the variables
    init(title:String, author:String, numberOfPages:Int, bookType:String, price:Float){
        self.title = title
        self.author = author
        self.numberOfPages = numberOfPages
        self.bookType = checkBookType(bookType)
        self.price = price
    }
    
    //All the getters and setters
    func setTitle(title:String) {
        self.title = title
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setAuthor(author:String) {
        self.author = author
    }
    
    func getAuthor() -> String {
        return self.author
    }
    
    func setNumberOfPages(numberOfPages:Int) {
        self.numberOfPages = numberOfPages
    }
    
    func getNumberOfPages() -> Int {
        return self.numberOfPages
    }
    
    func setBookType(bookType:String) {
        self.bookType = bookType
    }
    
    func getBookType() -> String {
        return self.bookType
    }
    
    func setPrice(price:Float) {
        self.price = price
    }
    
    func getPrice() -> Float {
        return self.price
    }
    
    //Check to make sure bookType is valid
    func checkBookType(bookType:String) -> String {
        if(bookType == "hardcover" || bookType == "softcover" || bookType == "eBook"){
            return bookType
        }
        return "ERROR"
    }
    
    //Return all the values as a String
    func description() -> String{
        return "Title: \"" + self.title + "\"\n# Pages: " + String(self.numberOfPages) + "\nBook Type: " + self.bookType + "\nPrice: " + String(self.price)
     }
    
    //Create a book and return it
    //ASK PROF ABOUT RETURNING
    func create(title:String, author:String, numberOfPages:Int, bookType:String, price:Float) -> Book{
        return Book(title: title,author: author,numberOfPages: numberOfPages,bookType: bookType,price: price)
    }
    
}
