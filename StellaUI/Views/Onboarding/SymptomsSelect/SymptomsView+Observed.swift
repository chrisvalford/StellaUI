//
//  SymptomsSelectView+Observed.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import SwiftUI

extension SymptomsSelectView {
    
    @MainActor
    class Observed: ObservableObject {
        
        @Published var symptoms: [Symptom] = []
        
        func fetchSymptons() {
            Task {
                do {
                    symptoms = try await API.fetchSymptoms()
                } catch {
                    print("Request failed with error: \(error)")
                }
            }
        }
        
        func saveState() {
            print("TODO: Save state")
        }
    }
}
