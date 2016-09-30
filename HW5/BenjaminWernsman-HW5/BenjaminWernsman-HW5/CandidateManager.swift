//
//  CandidateManager.swift
//  WernsmanBenjamin-HW4
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class CandidateManager: UIViewController, UIPopoverPresentationControllerDelegate, DataModelProtocol {
    
    @IBAction func addCandidateButton(sender: AnyObject) {
        self.performSegueWithIdentifier("AddCandidate", sender: self)
    }
    
    //Button that shows a popup when a user wants to vote
    @IBAction func voteButton(sender: AnyObject) {
        //userStorage.fromView = "vote"
        presentPopOver(sender)
    }
    
    //Button that shows a popup of the candidated and amout of votes
    @IBAction func ShowVotesButton(sender: AnyObject) {
        //userStorage.fromView = "showvote"
        presentPopOver(sender)
    }
    
    //Set the title when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Candidate Manager"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func notify(message:String){
        print(message)
        self.dismissViewControllerAnimated(true, completion: nil)
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
        
        if segue.identifier == "AddCandidate" {
            //let navigationController = segue.destinationViewController as? UINavigationController
            //let addItemViewController = navigationController?.topViewController as? AddCandidate
            
            let destination = segue.destinationViewController as! AddCandidate
            destination.delegate = self
            
            //if let viewController = addItemViewController {
            //    viewController.delegate = self
            //}
        }
    }

}
