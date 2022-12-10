//
//  ContentView.swift
//  Connectivity
//
//  Created by Ilona Sellenberkova on 06/12/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8518, longitude: 14.2681), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var showAddModal = false
    
    var body: some View {
        
        NavigationStack{
            Map(coordinateRegion: $region, annotationItems: annotationList) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {

                    Image(systemName: "\(annotation.activity.rawValue)")
                        .foregroundColor(.orange)
                        .overlay(
                                Circle()
                                .stroke(Color.orange, lineWidth:2)
                                .frame(width: 33, height: 33)
                        )
                }
            }
            .ignoresSafeArea()
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Activities")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // action
                    } label: {
                        Label("Search activity", systemImage: "magnifyingglass.circle.fill")
                            .padding(.bottom)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddModal.toggle()
                    } label: {
                        Label("Add activity", systemImage: "plus.circle.fill")
                            .padding(.bottom)
                    }
                }
                
            }
            .toolbarBackground(.visible, for: .navigationBar)
                
        } // end NavigationStack
        .sheet(isPresented: $showAddModal) {
            AddModalView()
                .presentationDetents([.medium, .large])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
