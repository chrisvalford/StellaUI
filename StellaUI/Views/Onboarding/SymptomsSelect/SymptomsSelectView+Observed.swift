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
        @Published var selected = Set<Symptom>()
        
        func fetchSymptoms() {
            // TODO: Fetch any symptom records from core data
            //       and merge the JSON
            Task {
                do {
                    symptoms = try await API.fetchSymptoms()
                } catch {
                    print("Request failed with error: \(error)")
                }
            }
        }
        
        func saveState() {
            var index = 1
            let context = PersistenceController.shared.container.viewContext
            for symptom in selected {
                let record = SymptomMO(context: context)
                record.id = Int16(symptom.id)
                record.title = symptom.title
                record.imageName = symptom.imageName
                record.selected = true
                record.sequence = Int16(index)
                index += 1
            }
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
