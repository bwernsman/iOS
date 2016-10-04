//
//  CandidateManager.swift
//  WernsmanBenjamin-HW5
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

//Data model protocol
protocol DataModelProtocol: NSObjectProtocol {
    func notify(message:String)
}

class CandidateManager: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var delegate: DataModelProtocol?
    
    //Called from other function
    //NSNotificationCenter.defaultCenter().postNotificationName("addCandidateNotification", object: nil)

    
    //Button that takes the user to the add candidate screen
    @IBAction func addCandidateButton(sender: AnyObject) {
        self.performSegueWithIdentifier("AddCandidate", sender: self)
    }
    
    //Button that shows a popup when a user wants to vote
    @IBAction func voteButton(sender: AnyObject) {
        candidateManager.fromView = "vote"
        presentPopOver(sender)
    }
    
    //Button that shows a popup of the candidated and amout of votes
    @IBAction func ShowVotesButton(sender: AnyObject) {
        candidateManager.fromView = "showvote"
        presentPopOver(sender)
    }
    
    //Set the title when the view loads, and load all the candidates from persistant disk
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Candidate Manager"
        deviceStorage.loadModel()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CandidateManager.addCandidate(_:)),name:"addCandidateNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CandidateManager.addVote(_:)),name:"addVoteNotification", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Add candidate notification
    func addCandidate(notification: NSNotification){
        //let dict = notification.object as! NSDictionary
        print("Add candidate notification")
        
        NSNotificationCenter.defaultCenter().postNotificationName("notifyNotification", object: nil)
    }
    
    //Add vote notification
    func addVote(notification: NSNotification){
        let id = notification.object as! Int
        deviceStorage.addVote(candidateManager.candidates[id],id: Int64(id))
        
        print("voting")
    }
    
    //Helper function that creates a popover
    func presentPopOver(sender: AnyObject){
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("popoverID")
        popController.modalPresentationStyle = UIModalPresentationStyle.Popover
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender as? UIView
        popController.popoverPresentationController?.sourceRect = sender.bounds
        self.presentViewController(popController, animated: true, completion: nil)
    }
    
    //Function that dictates a popover should not be full screen
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    //Create a custom bar button so it says "Back"
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
    }

}
