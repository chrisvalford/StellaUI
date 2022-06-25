//
//  Set+Persistance.swift
//  StellaUI
//
//  Created by Christopher Alford on 15/6/22.
//

import CoreData
import Foundation

extension Set {
    func persist() {
        for (_, item) in self.enumerated() {
            switch item.self {
            case is Symptom:
                let context = PersistenceController.shared.container.viewContext
                let fetchRequest: NSFetchRequest<SymptomMO>
                fetchRequest = SymptomMO.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "id == %d", (item as! Symptom).id)
                do {
                    let fetched = try context.fetch(fetchRequest)
                    if fetched.count == 1 {
                        fetched.first?.selected = true
                        fetched.first?.sequence = (item as! Symptom).sequence
                        try context.save()
                    } else {
                        print("Cannot find record with id: \((item as! Symptom).id)")
                    }
                } catch {
                    print(error)
                }

            default:
                print("Unsurported type")
            }
        }
    }
}
