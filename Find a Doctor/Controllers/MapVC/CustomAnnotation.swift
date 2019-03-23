//
//  CustomAnnotation.swift
//  Find a Doctor
//
//  Created by Arun Gattadi on 21/03/19.
//  Copyright © 2019 Calibrage Info System Pvt Ltd. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var doctorName : String?
    var doctorGender: String?
    var doctorSpecialization : String?
    
    init(doctorName: String, doctorGender: String, doctorSpecialization:String, coordinate: CLLocationCoordinate2D) {
        self.doctorName = doctorName
        self.doctorGender = doctorGender
        self.doctorSpecialization  = doctorSpecialization
        self.coordinate = coordinate
        super.init()
    }

}
