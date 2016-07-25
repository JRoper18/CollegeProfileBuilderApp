//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by Jack Roper on 7/25/16.
//  Copyright © 2016 Jack Roper. All rights reserved.
//

import UIKit

class College: NSObject {
    var name : String;
    var location: String;
    var enrollment: Int;
    var image: UIImage;
    init(name: String, location: String, enrollment: Int, image: UIImage){
        self.name = name;
        self.location = location;
        self.enrollment = enrollment;
        self.image = image;
    }
}
