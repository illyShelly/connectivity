//
//  AddModalView.swift
//  Connectivity
//
//  Created by Valentina Russo on 09/12/22.
//

import SwiftUI
import CoreLocation

struct AddModalView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var AnnotationVM = AnnotationViewModel()
    @State private var place = ""
    @State private var details = ""
    @State private var selectedItem : Activity = .sport
    
    var body: some View {
        VStack(spacing: 33){
            Text("Select activity")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top)
            
            HStack(spacing: 33){
                ForEach(Activity.allCases, id: \.hashValue) { activity in
                    Button() {
                        selectedItem = activity
                    }label: {
                        if (selectedItem == activity) {
                            ZStack{
                                Circle()
                                .frame(width: 52, height: 52)

                                Image(systemName: "\(activity.rawValue)")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                            }
                            .padding(-5)
                        }
                        else {
                            Image(systemName: "\(activity.rawValue)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .overlay(
                                        Circle()
                                        .stroke(Color.orange, lineWidth:2)
                                        .frame(width: 50, height: 50)
                                )
                                .padding(5)
                        }
                        

                    }
                }
            }
            TextField("Place", text: $place)
            TextField("Details", text: $details)
            Spacer()
            Button {
                let newAnnotation = Annotation(place: place, details: details, activity: selectedItem, coordinate: CLLocationCoordinate2D(latitude: 40.8518, longitude: 14.2681))
                
                AnnotationVM.addAnnotation(newAnnotation: newAnnotation)
                print(newAnnotation)
                dismiss()
            } label: {
                Text("Share Activity")
                    .frame(maxWidth: 200)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange)
            }
        }
        .padding()
    }
}


struct AddModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddModalView()
    }
}
