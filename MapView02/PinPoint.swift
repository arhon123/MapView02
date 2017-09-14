//
//  PinPoint.swift
//  MapView02
//
//  Created by D7703_18 on 2017. 9. 14..
//  Copyright © 2017년 D7703_18. All rights reserved.
//

import UIKit
import MapKit

class PinPoint: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
