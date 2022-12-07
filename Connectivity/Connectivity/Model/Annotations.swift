//
//  Annotations.swift
//  Connectivity
//
//  Created by Valentina Russo on 07/12/22.
//

import Foundation
import MapKit

struct Annotation : Identifiable {
    let id = UUID()
    var place : String
    var activity : String
    var coordinate : CLLocationCoordinate2D
}

