//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Jack Roper on 7/25/16.
//  Copyright © 2016 Jack Roper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButtonState: UIBarButtonItem!
    @IBAction func onEditButton(sender: AnyObject) {
        tableView.editing = !tableView.editing;
    }
    @IBAction func onTappedPlusButton(sender: AnyObject) {
        let alert = UIAlertController(title: "Add College", message: "Don't worry, you can edit this later.", preferredStyle: .Alert);
        alert.addTextFieldWithConfigurationHandler{
            (textField) in textField.placeholder = "Add college name here";
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alert.addAction(cancelAction);
            let addCollegeAction = UIAlertAction(title: "Add", style: .Default){ (action) in
                let collegeTextField = alert.textFields![0] as UITextField;
                self.colleges.append(College(name: collegeTextField.text!, location: "Unknown", enrollment: 0, image: UIImage(), url: NSURL()));
                self.tableView.reloadData();
            }
            alert.addAction(addCollegeAction)
            self.presentViewController(alert, animated: true, completion: nil);
        }
    }
    var colleges : [College] = [College(name: "Example College", location: "Carhein", enrollment: 1000, image: UIImage(), url: NSURL())];
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.editing = false;
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return colleges.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("CollegeCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name;
        return cell;
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row);
        colleges.insert(college, atIndex: destinationIndexPath.row);
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!];
        dvc.collegeIndex = index!
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            colleges.removeAtIndex(indexPath.row);
            tableView.reloadData();
        }
    }
    
}

