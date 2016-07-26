//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Jack Roper on 7/25/16.
//  Copyright © 2016 Jack Roper. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    var collegeIndex : Int!;
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var collegeImageView: UIImageView!
    var college : College!;
    override func viewDidLoad() {
        nameTextField.text = college.name;
        locationTextField.text = college.location;
        enrollmentTextField.text = String(college.enrollment);
        collegeImageView.image = college.image;
    }
    @IBAction func onSaveButtonPressed(sender: AnyObject) {
        
        college.name = nameTextField.text!;
        college.location = locationTextField.text!;
        college.enrollment = Int(enrollmentTextField.text!)!;
        print(college.name);

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        dvc.colleges[collegeIndex] = college;
    }
    
}
