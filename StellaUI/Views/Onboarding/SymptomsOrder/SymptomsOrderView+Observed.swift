//
//  SymptomsOrderView+Observed.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import CoreData
import SwiftUI

extension SymptomsOrderView {
    class Observed: ObservableObject {
        
        @Published var symptoms: [Symptom] = []
        
        init() {
            fetchSymptoms()
        }
        
        func fetchSymptoms() {
            let context = PersistenceController.shared.container.viewContext
            let fetchRequest: NSFetchRequest<SymptomMO>
            fetchRequest = SymptomMO.fetchRequest()

            fetchRequest.predicate = NSPredicate(
                format: "selected == YES"
            )
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sequence", ascending: true)]

            do {
                let fetched = try context.fetch(fetchRequest)
                symptoms = fetched.map { $0.symptom }
            } catch {
                print(error)
            }
        }
    }
}
