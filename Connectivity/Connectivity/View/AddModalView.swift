//
//  AddModalView.swift
//  Connectivity
//
//  Created by Valentina Russo on 09/12/22.
//

import SwiftUI

struct AddModalView: View {
    @Environment(\.dismiss) var dismiss
    @State private var place = ""
    @State private var detail = ""
    @State private var selectedItem : Activity = Activity.sport
    
    var body: some View {
        VStack(spacing: 33){
            Text("Select activity")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(.top)
            
            HStack(spacing: 33){
                ForEach(Activity.allCases, id: \.rawValue) { activity in
                    Button() {
                        selectedItem = activity
                    }label: {
                        Image(systemName: "\(activity.rawValue)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .overlay(
                                    Circle()
                                    .stroke(Color.orange, lineWidth:2)
                                    .frame(width: 50, height: 50)
                            )
                    }
                }
            }
            TextField("Place", text: $place)
            TextField("Details", text: $detail)
            Spacer()
            Button {
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
