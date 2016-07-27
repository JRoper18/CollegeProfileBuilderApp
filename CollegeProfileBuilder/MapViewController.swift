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
                let placemark = placeMarks!.first as CLPlacemark!;
                self.location = placemark.location!.coordinate
                self.displayMap()
                
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
        let region = MKCoordinateRegionMake(center, span);
        let pin = MKPointAnnotation();
        pin.coordinate = center;
        pin.title = self.pinTitle;
        mapView.addAnnotation(pin);
        mapView.setRegion(region, animated: true)
    }    
    
}
