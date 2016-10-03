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
    
    func addVote(voteCandidate:Candidate){
        
        let fetchedResults = retrievePeople()
        
        for person in fetchedResults {
            if(person.valueForKey("first_name") != nil && String(person.valueForKey("first_name")!) == voteCandidate.first_name){
                person.setValue(Int(voteCandidate.votes), forKey: "votes")
                do {
                    try person.managedObjectContext?.save()
                } catch {
                    let saveError = error as NSError
                    print(saveError)
                }
            }
        }
    }
    
    func updateModel(first_name: String, last_name: String, state:String, party:String, votes:Int64, callback: (Bool) -> ()) {
        
        storeCandidate(first_name, last_name: last_name, state: state, party:party, votes:votes)
        
        if(validateModel(first_name, last_name: last_name, state: state, party:party, votes:votes)){
            candidateManager.candidates.append(Candidate(first_name: first_name,last_name: last_name,state: state, party: party,votes: 0))
            return callback(true)
        }
        else{
            return callback(false)
        }
    }
    
    func loadModel() {
        let fetchedResults = retrievePeople()
        
        for person in fetchedResults {
            if let first_name = person.valueForKey("first_name") {
                if let last_name = person.valueForKey("last_name") {
                    if let state = person.valueForKey("state") {
                        if let party = person.valueForKey("party") {
                            if let votes = person.valueForKey("votes")?.integerValue {
                                let voteConverted: Int64? = Int64(votes)
                                candidateManager.candidates.append(Candidate(first_name: first_name as! String,last_name: last_name as! String,state: state as! String, party: party as! String,votes: voteConverted!))
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func validateModel(first_name: String, last_name: String, state:String, party:String, votes:Int64) -> Bool{
        let fetchedResults = retrievePeople()
        for person in fetchedResults {
            if(person.valueForKey("first_name") != nil && String(person.valueForKey("first_name")!) == first_name){
                return true
            }
        }
        return false
    }
    
    
    func storeCandidate(first_name: String, last_name: String, state:String, party:String, votes:Int64) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        // Set the attribute values
        person.setValue(first_name, forKey: "first_name")
        person.setValue(last_name, forKey: "last_name")
        person.setValue(state, forKey: "state")
        person.setValue(party, forKey: "party")
        person.setValue(Int(votes), forKey: "votes")
        
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
    
    //Delete stored data, on
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
                    print("\(result.valueForKey("first_name")!) has been Deleted")
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