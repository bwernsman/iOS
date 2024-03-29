//
//  PopOver.swift
//  WernsmanBenjamin-HW4
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/22/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class PopOver: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    //Connect the tableview to the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    //Cell identifier for the tableview
    let textCellIdentifier = "TextCell"
    
    //When the view loads, set the delegate and the datasource
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Every time the view is about to appear, reload the table to make sure the info is up to date
    //If there are no candidates, show a label, if not show a table all the candidates
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        if(userStorage.candidates.count == 0){
            tableView.alpha = 0
            let NoCandidateLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
            NoCandidateLabel.center = CGPointMake(self.preferredContentSize.width/2,self.preferredContentSize.height/2)
            NoCandidateLabel.textAlignment = NSTextAlignment.Center
            NoCandidateLabel.text = "No candidates"
            self.view.addSubview(NoCandidateLabel)
        }
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
            if(userStorage.candidates[indexPath.row].votes < 1){
                userStorage.candidates[indexPath.row].addVote()
                showAlert("Vote Casted", message: "You voted for " + userStorage.candidates[indexPath.row].getName())
            }
            else{
                showAlert("ERROR", message: "You can only vote for a candidate once!")
            }
        }
    }
    
    //Show an alert if we need to alert the user
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}