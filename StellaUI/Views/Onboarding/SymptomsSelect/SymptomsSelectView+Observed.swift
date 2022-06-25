//
//  SymptomsSelectView+Observed.swift
//  StellaUI
//
//  Created by Christopher Alford on 10/6/22.
//

import CoreData
import SwiftUI

extension SymptomsSelectView {
    
    @MainActor
    class Observed: ObservableObject {
        
        @Published var symptoms: [Symptom] = []
        @Published var selected = Set<Symptom>()
        private var apiSymptoms: [Symptom] = []
        
        init() {
            fetchSymptoms(completion: { results in
                // If we don't have any results return the API symptoms
                // otherwise merge the two result sets
                if results.count == 0 {
                    Task {
                        do {
                            symptoms = try await API.fetchSymptoms()
                        } catch {
                            print(error)
                        }
                    }
                } else {
                    Task {
                        do {
                            apiSymptoms = try await API.fetchSymptoms()
                        } catch {
                            print(error)
                        }
                        for symptom in apiSymptoms {
                            if let index = results.firstIndex(of: symptom) {
                                symptoms.append(results[index])
                                selected.insert(results[index])
                            } else {
                                symptoms.append(symptom)
                            }
                        }
                    }
                }
            })
        }
        
        func fetchSymptoms(completion: ([Symptom]) -> Void) {
            let context = PersistenceController.shared.container.viewContext
            let fetchRequest: NSFetchRequest<SymptomMO>
            fetchRequest = SymptomMO.fetchRequest()

            fetchRequest.predicate = NSPredicate(
                format: "selected == YES"
            )
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sequence", ascending: true)]

            do {
                let fetched = try context.fetch(fetchRequest)
                completion(fetched.map { $0.symptom })
            } catch {
                print(error)
            }
        }
        
//        func fetchSymptoms() {
//            // TODO: Fetch any symptom records from core data
//            //       and merge the JSON
//            Task {
//                do {
//                    symptoms = try await API.fetchSymptoms()
//                } catch {
//                    print("Request failed with error: \(error)")
//                }
//            }
//        }
        
        func updateSelected(id: Int16) {
            guard let symptom = symptom(id: id) else { return }
            // If the symptom is in the Set then it is selected
            if let _ = selected.firstIndex(of: symptom) {
                selected.remove(symptom)
                Symptom.setSelected(id: symptom.id, to: false)
            } else {
                selected.insert(symptom)
                Symptom.setSelected(id: symptom.id, to: true)
            }
        }
        
        private func symptom(id: Int16) -> Symptom? {
            if let i = symptoms.firstIndex(where: { $0.id == id }) {
                return symptoms[i]
            }
            return nil
        }
    }
}
