//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var myTuple = ("Hello",3.14,98.6)

var name:(String,String) = ("Justin","Bieber")

var(firstNmae,lastName) = name
print(firstNmae)


var user = (firstName:"Ben",lastName:"Wernsman")
print(user.firstName)


var blocks:[Int] = [1,2,3,4]
var count:Int = 0

for index in 1 ..< blocks.count {
    count += blocks[index]
}

print(count)


func printNames(firstName first:String, lastName last:String){
    print("\(first) \(last)")
}

printNames(firstName: "Ben", lastName: "W")
