//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Jack Roper on 7/25/16.
//  Copyright © 2016 Jack Roper. All rights reserved.
//

import UIKit
import MapKit
class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    var collegeIndex : Int!;
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var collegeImageView: UIImageView!
    var college : College!;
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        imagePicker.delegate = self;
        nameTextField.text = college.name;
        locationTextField.text = college.location;
        enrollmentTextField.text = String(college.enrollment);
        collegeImageView.image = college.image;
        websiteTextField.text = college.url.absoluteString;
        
    }
    
    let imagePicker = UIImagePickerController()
    @IBAction func onCameraButtonTap(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func openWebsiteButtonPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(college.url);
        
    }
    @IBAction func onLibraryButtonTap(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : AnyObject]){
        imagePicker.dismissViewControllerAnimated(true, completion: {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.collegeImageView.image = selectedImage;
            self.college.image = selectedImage;
        })
        
    }
    @IBAction func onSaveButtonPressed(sender: AnyObject) {
        college.name = nameTextField.text!;
        college.location = locationTextField.text!;
        college.enrollment = Int(enrollmentTextField.text!)!;
        college.url = NSURL(string: websiteTextField.text!)!;
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SegueToMainView"){
            let dvc = segue.destinationViewController as! ViewController
            dvc.colleges[collegeIndex] = college;
        }
        else{
            let dvc = segue.destinationViewController as! MapViewController
            dvc.locationString = locationTextField.text!
            dvc.pinTitle = self.nameTextField.text!;
            dvc.span = MKCoordinateSpanMake(0.1, 0.1)


            
        }
     }
}
