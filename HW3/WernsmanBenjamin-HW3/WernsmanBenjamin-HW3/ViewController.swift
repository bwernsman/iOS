//
//  ViewController.swift
//  WernsmanBenjamin-HW3
//
//  Created by Ben Wernsman on 9/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//
import Foundation
import UIKit

public let calcOperators = [
    "Add", "Subtract", "Multiply", "Divide",
]

let textCellIdentifier = "TextCell"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var operatorType:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Calculator"
    
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calcOperators.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = calcOperators[row]
        
        return cell
    }
    
    
    // No methods are required to conform to UITableViewDelegate,
    // because all methods in the protocol are optional.
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        operatorType = calcOperators[indexPath.row]
        self.performSegueWithIdentifier("teamSegueIdentifier", sender: self)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "teamSegueIdentifier"){
            let destination = segue.destinationViewController as! CalculateView
            destination.operatorType = operatorType
        }
    }
}

