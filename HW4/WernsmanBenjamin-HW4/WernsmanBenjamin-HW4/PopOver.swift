//
//  PopOver.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/22/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class PopOver: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        print("View will appear")
    }
    
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    //Set the number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Set the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userStorage.candidates.count
    }
    
    //Set the info in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        
        if(userStorage.fromView == "vote"){
            cell.textLabel?.text = userStorage.candidates[row].getName()
        }
        else{
            cell.textLabel?.text = userStorage.candidates[row].getName() + " " + userStorage.candidates[row].getVotes()
        }
        
        return cell
    }
    
    //When a row is tapped, collect the info and store it so we can pass it to the next view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //If they can vote lets count it
        if(userStorage.fromView == "vote"){
            userStorage.candidates[indexPath.row].addVote()
            showAlert("Vote Casted", message: "You voted for " + userStorage.candidates[indexPath.row].getName())
        }
        
        
    }
    
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: {action in
            self.ButtonPressed()}))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func ButtonPressed(){
        self.dismissViewControllerAnimated(false, completion: nil)
    }

}