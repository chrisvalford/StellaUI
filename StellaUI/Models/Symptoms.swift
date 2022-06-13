//
//  Symptoms.swift
//  StellaUI
//
//  Created by Christopher Alford on 11/6/22.
//

import CoreData
import Foundation

class Symptoms {
    
    @Published var symptoms: [SymptomMO] = []
    @Published var selected = Set<SymptomMO>()
    
    func fetchSymptoms() {
        // TODO: Fetch any symptom records from core data
        //       and merge the JSON
        Task {
            do {
                let objects = try await API.fetchSymptoms()
                for object in objects {
                    
                }
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    func loadState() {
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<SymptomMO>
        fetchRequest = SymptomMO.fetchRequest()

        fetchRequest.predicate = NSPredicate(
            format: "selected == YES"
        )

        do {
            symptoms = try context.fetch(fetchRequest)
        } catch {
            print(error)
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
