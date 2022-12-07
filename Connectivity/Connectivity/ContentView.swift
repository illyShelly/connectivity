//
//  ContentView.swift
//  Connectivity
//
//  Created by Ilona Sellenberkova on 06/12/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8518, longitude: 14.2681), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        
        Map(coordinateRegion: $region, annotationItems: annotation) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                Circle()
                    .stroke(.red, lineWidth: 3)
                    .frame(width: 22, height: 22)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
