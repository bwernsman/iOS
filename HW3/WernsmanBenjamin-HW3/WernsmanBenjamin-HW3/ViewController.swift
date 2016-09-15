//
//  ViewController.swift
//  WernsmanBenjamin-HW3
//  EID:  bw47828
//  Course:  CS378
//
//  Created by Ben Wernsman on 9/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Connect the table view to the storyboard
    @IBOutlet weak var tableView: UITableView!
    
    //Set the text cell identifier
    let textCellIdentifier = "TextCell"
    
    //Create 2 arrays, one for the operator names and the other for the operator label in the next view
    let calcOperatorNames = [
        "Add", "Subtract", "Multiply", "Divide",
    ]
    
    let calcOperators = [
        "+", "-", "*", "/"
    ]
    
    //Set values to pass to the next view
    var operatorName:String = ""
    var operatorType:String = ""

    //When the view loads, set the title, the delegate and the datasource
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Calculator"
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Set the number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Set the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calcOperatorNames.count
    }
    
    //Set the info in the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = calcOperatorNames[row]
        
        return cell
    }
    
    //When a row is tapped, collect the info and store it so we can pass it to the next view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        operatorName = calcOperatorNames[indexPath.row]
        operatorType = calcOperators[indexPath.row]
        self.performSegueWithIdentifier("teamSegueIdentifier", sender: self)
    }
    
    //When transitioning to a new view, make sure that we send the operator name and operator type
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "teamSegueIdentifier"){
            let destination = segue.destinationViewController as! CalculateView
            destination.operatorName = operatorName
            destination.operatorType = operatorType
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

