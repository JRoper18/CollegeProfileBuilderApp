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

    var colleges : [College] = [College(name: "Example College", location: "Carhein", enrollment: 1000, image: UIImage())];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return colleges.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("CollegeCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name;
        return cell;
    }
    
}

