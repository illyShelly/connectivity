//
//  Annotations.swift
//  Connectivity
//
//  Created by Valentina Russo on 07/12/22.
//

import Foundation
import MapKit

enum Activity : String , CaseIterable{
    case sport = "figure.run"
    case drinkOrEat = "cup.and.saucer.fill"
    case cultural = "book.fill"
    
//    public static func caseToStr() -> String{
//        switch self {
//        case .sport :
//            return "figure.run"
//        case .drinkOrEat :
//            return "cup.and.saucer.fill"
//        case .cltural :
//            return "theatermasks.fill"
//        }
//    }
}

struct Annotation : Identifiable {
    let id = UUID()
    var place : String
    var details : String
    var activity : Activity
    var coordinate : CLLocationCoordinate2D
    var peopleNumber : Int = 1
}

