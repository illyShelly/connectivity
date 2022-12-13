//
//  AnnotationVM.swift
//  Connectivity
//
//  Created by Valentina Russo on 13/12/22.
//

import Foundation

class AnnotationViewModel: ObservableObject {
    // manage annotation data
    @Published var AnnotationDB = annotationList
    
    // manage user actions
    func addAnnotation(newAnnotation: Annotation) {
        AnnotationDB.append(newAnnotation)
    }
}
