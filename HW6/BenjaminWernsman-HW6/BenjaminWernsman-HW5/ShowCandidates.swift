//
//  ShowCandidates.swift
//  WernsmanBenjamin-HW6
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/21/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class ShowCandidates: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Text cell identifier used for the table view, and the segue identifier
    let textCellIdentifier = "TextCell"
    let segueIdentifier = "ShowDetail"
    
    //Stores the index tapped and passes it to the next view (via segue)
    var indexTapped:Int = 0
    
    //Screen width and height of the view
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    //Table view linked from the story board
    @IBOutlet weak var tableView: UITableView!
    
    //Sets the title, the delegate and the datasource for the table view
    //Gets the screen width and view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Show Candidates"
        tableView.delegate = self
        tableView.dataSource = self
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
    }
    
    //Every time the view is about to appear, reload the table to make sure the info is up to date
    //If there are no candidates, show a label, if not show a table all the candidates
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        
        if(candidateManager.candidates.count == 0){
            tableView.alpha = 0
            let NoCandidateLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
            NoCandidateLabel.center = CGPointMake(screenWidth/2,screenHeight/2)
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
        return candidateManager.candidates.count
    }
    
    //Set the info in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = candidateManager.candidates[row].getName()
        cell.detailTextLabel?.text = candidateManager.candidates[row].party
        return cell
    }
    
    //When a row is tapped, collect the info and store it so we can pass it to the next view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        indexTapped = indexPath.row
        self.performSegueWithIdentifier(segueIdentifier, sender: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Create a custom bar button so it says "Back"
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == segueIdentifier){
            let destination = segue.destinationViewController as! CandidateDetail
            let backButton = UIBarButtonItem()
            backButton.title = "Back"
            navigationItem.backBarButtonItem = backButton
            destination.indexTapped = indexTapped
        }
    }
}
