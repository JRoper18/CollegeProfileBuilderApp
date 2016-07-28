//
//  MapViewController.swift
//  CollegeProfileBuilder
//
//  Created by Jack Roper on 7/27/16.
//  Copyright © 2016 Jack Roper. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    var pinTitle : String!;
    var span: MKCoordinateSpan!;
    var locationString : String!;
    var location : CLLocationCoordinate2D!;
    override func viewDidLoad(){
        super.viewDidLoad();
        locationTextField.text = locationString;
        getAddress();
        
    }
    func getAddress(){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationString, completionHandler: { (placeMarks, error) in
            if error != nil{
                print(error)
            }
                //I FINALLY GOT THIS TO ASYNC LOAD
                //I WAS SO CONFUSED AND SPENT A HOURS TRYING TO FIGURE OUR WHY IT DIDNT WORK
                //I DID IT
            else{
                if placeMarks!.count == 1 {
                    self.location = placeMarks!.first!.location!.coordinate;
                    self.displayMap()

                }
                else{
                    let alertController = UIAlertController(title: nil, message: "A standard alert.", preferredStyle: .ActionSheet)
                    for placemark in placeMarks!{
                        let newLocationAction = UIAlertAction(title: placemark.name, style: .Default){ (action) in
                            self.location = placemark.location!.coordinate;
                            self.displayMap()
                        }
                        alertController.addAction(newLocationAction);
                    }
                    self.presentViewController(alertController, animated: true) {
                        // ...
                    }
                }
                
                
            }
            
        })
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        self.locationString = textField.text!;
        self.getAddress()
        return true;
    }
    func displayMap(){
        let center = self.location;
        let region = MKCoordinateRegionMake(center, self.span);
        let pin = MKPointAnnotation();
        pin.coordinate = center;
        pin.title = self.pinTitle;
        mapView.addAnnotation(pin);
        mapView.setRegion(region, animated: true)
    }    
    
}
