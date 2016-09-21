//
//  ShowCandidates.swift
//  WernsmanBenjamin-HW4
//
//  Created by Ben Wernsman on 9/21/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import UIKit

class ShowCandidates: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let textCellIdentifier = "TextCell"
    let segueIdentifier = "ShowDetail"
    var indexTapped:Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Show Candidates"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        print("Updating table")
        print(userStoage.candidates.count)
    }
    
    //Set the number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Set the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(userStoage.candidates.count)
        //return userStoage.candidates.count
        return 1
    }
    
    //Set the info in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        //cell.textLabel?.text = userStoage.candidates[row].first_name + userStoage.candidates[row].last_name
        
        cell.textLabel?.text = "TESTTT"
        
        print("setting info")
        //print(userStoage.candidates[row].first_name)
        
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
