//
//  PopOver.swift
//  WernsmanBenjamin-HW6
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/22/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class PopOver: UIViewController, UITableViewDataSource, UITableViewDelegate, DataModelProtocol  {
    
    //Connect the tableview to the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    //Cell identifier for the tableview
    let textCellIdentifier = "TextCell"
    
    //When the view loads, set the delegate and the datasource
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PopOver.notifyAlert(_:)),name:"alertVote", object: nil)
    }
    
    //Every time the view is about to appear, reload the table to make sure the info is up to date
    //If there are no candidates, show a label, if not show a table all the candidates
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        if(candidateManager.candidates.count == 0){
            tableView.alpha = 0
            let NoCandidateLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
            NoCandidateLabel.center = CGPointMake(self.preferredContentSize.width/2,self.preferredContentSize.height/2)
            NoCandidateLabel.textAlignment = NSTextAlignment.Center
            NoCandidateLabel.text = "No candidates"
            self.view.addSubview(NoCandidateLabel)
        }
    }
    
    //Notify the user when data is saved
    func notifyAlert(notification: NSNotification){
        let success:Bool = notification.object as! Bool
        let controller = CandidateManager(nibName: "CandidateManager", bundle: nil)
        controller.delegate = self
        
        if(success){
            controller.delegate?.notify("Data has been saved")
        }
        else{
            controller.delegate?.notify("Error storing data to persistent storage")
        }
    }
    
    //Set the number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Set the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidateManager.candidates.count
    }
    
    //Set the info in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        
        if(candidateManager.fromView == "vote"){
            cell.textLabel?.text = candidateManager.candidates[row].getName()
        }
        else{
            cell.textLabel?.text = candidateManager.candidates[row].getName() + " " + candidateManager.candidates[row].getVotes()
        }
        
        return cell
    }
    
    //Dispatch an alert with the given message
    func notify(message:String){
        dispatch_async(dispatch_get_main_queue()){
            self.showAlert("Alert",message: message)
        }
    }
    
    //When a row is tapped, collect the info and store it so we can pass it to the next view
    //Pass the index to the mainVC so we can register the users vote
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let controller = CandidateManager(nibName: "CandidateManager", bundle: nil)
        controller.delegate = self
        
        //If they can vote lets count it
        if(candidateManager.fromView == "vote"){
            if(candidateManager.candidates[indexPath.row].votes < 1){
                let index:Int = indexPath.row
                NSNotificationCenter.defaultCenter().postNotificationName("voteNotification", object: index)
            }
            else{
                controller.delegate?.notify("You can only vote for a candidate once!")
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