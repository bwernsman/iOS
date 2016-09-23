//
//  CandidateManager.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/20/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class CandidateManager: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var tableView = UITableView()
    
    @IBAction func voteButton(sender: AnyObject) {
        userStorage.fromView = "vote"
        presentPopOver(sender)
    }
    
    @IBAction func ShowVotesButton(sender: AnyObject) {
        userStorage.fromView = "showvote"
        presentPopOver(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Candidate Manager"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func presentPopOver(sender: AnyObject){
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("popoverID")
        popController.modalPresentationStyle = UIModalPresentationStyle.Popover
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender as? UIView
        popController.popoverPresentationController?.sourceRect = sender.bounds
        self.presentViewController(popController, animated: true, completion: nil)
    }
    
    
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
