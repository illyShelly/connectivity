//
//  ContentView.swift
//  Connectivity
//
//  Created by Ilona Sellenberkova on 06/12/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var AnnotationVM = AnnotationViewModel()
    
    @State private var userPosition = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8518, longitude: 14.2681), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var showAddModal = false
    
    var body: some View {
        
        NavigationStack{
            Map(coordinateRegion: $userPosition, annotationItems: AnnotationVM.AnnotationDB) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    ZStack{
                        Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.orange)

                        Image(systemName: "\(annotation.activity.rawValue)")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
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
                        // add action
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
            AddModalView(AnnotationVM: AnnotationVM)
                .presentationDetents([.medium, .large])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
