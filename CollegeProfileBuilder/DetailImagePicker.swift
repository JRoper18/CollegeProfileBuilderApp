//
//  ViewController.swift
//  CameraTesting
//
//  Created by Jack Roper on 7/26/16.
//  Copyright © 2016 Jack Roper. All rights reserved.
//

import UIKit

class DetailImagePicker: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var image : UIImage! = UIImage();
    var currentCollege : College!;
    @IBAction func onCameraButtonTap(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func onLibraryButtonTap(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage;
            self.image = selectedImage;
        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Segue"){
            let dvc = segue.destinationViewController as! DetailViewController
            dvc.college = currentCollege;
            dvc.college.image = image;
        }

        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        imagePicker.delegate = self;
        imageView.image = image;
    }
    
    
}

