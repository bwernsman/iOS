//
//  DeviceStorage.swift
//  BenjaminWernsman-HW5
//
//  Created by Ben Wernsman on 10/2/16.
//  Copyright © 2016 Ben Wernsman. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DeviceStorage {
    func demoCoreData() {
        
        storePerson("Justin Timberlake", age:35)
        storePerson("Beyonce Knowles", age:35)
        storePerson("Drake", age:29)
        storePerson("Rihanna", age:28)
        print("Stored four people")
        
        let fetchedResults = retrievePeople()
        
        for person in fetchedResults {
            if let personName = person.valueForKey("name") {
                if let personAge = person.valueForKey("age") {
                    print("Retrieved: \(personName), age \(personAge)")
                }
            }
        }
        
        // Remove all objects from Core Data
        clearCoreData()
        
    }
    
    func storePerson(name: String, age: Int32) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        print(managedContext)
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        person.setValue(name, forKey: "name")
        person.setValue(Int(age), forKey: "age")
        
        // Commit the changes
        do {
            try managedContext.save()
        } catch {
            // If an error occurs
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
    }
    
    func retrievePeople() -> [NSManagedObject] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        
        
        let fetchRequest = NSFetchRequest(entityName:"Person")
        var fetchedResults:[NSManagedObject]? = nil
        
        // Examples of filtering using predicates
        // let predicate = NSPredicate(format: "age = 35")
        // let predicate = NSPredicate(format: "name CONTAINS[c] 'ake'")
        // fetchRequest.predicate = predicate
        
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        } catch {
            // If an error occurs
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        return(fetchedResults)!
        
    }
    
    func clearCoreData() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        var fetchedResults:[NSManagedObject]
        
        do {
            try fetchedResults = managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            if fetchedResults.count > 0 {
                
                for result:AnyObject in fetchedResults {
                    managedContext.deleteObject(result as! NSManagedObject)
                    print("\(result.valueForKey("name")!) has been Deleted")
                }
            }
            try managedContext.save()
            
        } catch {
            // If an error occurs
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
    }

}

var deviceStorage = DeviceStorage()